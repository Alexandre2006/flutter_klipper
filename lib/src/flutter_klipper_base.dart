import 'dart:async';
import 'dart:io';

import 'package:flutter_klipper/src/commands/base.dart';
import 'package:flutter_klipper/src/errors/klipper_conn_err.dart';
import 'package:flutter_klipper/src/services/status_notifiers.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// TODO:
// - Commands:
//   - Parser for all retunrs
//   - Write Tests for all commands
//   - Documentation for All
// - File Operations:
//   - Basic Implementation
//   - Parser for all retunrs
//   - Write Tests for all commands
//   - Documentation for All
// - Events:
//   - Subscription Events
//   - GCode Response Events
//   - File Operations Events
//   - Update Manager
//   - CPU Throttling
//   - Moonraker Stats
//   - History
//   - User Changes
//   - Service Mode
//   - Job Queue
//   - Button Events
//   - Announcements
//   - Sudo Access
//   - Agent Events
//   - Sensor Events

/// A class for communicating with a Klipper instance over WebSockets using JSON-RPC (via Moonraker).
class Klipper {
  // Configuration
  final String host;
  final int port;
  String? token;

  // WebSocket
  late WebSocketChannel? _wsc;
  late WebSocket? _ws;
  final Duration timeout;

  // JSON-RPC
  late Peer _jsonRpc;

  // Status
  /// Listenable Notifier for monitoring the status of the Klipper instance.
  KlipperStatusNotifier statusNotifier = KlipperStatusNotifier();
  bool _closed = false;

  // Constructor
  /// Creates a new Klipper instance. [host] is the hostname or IP address of the Klipper instance. [port] is the port of the Klipper instance. [timeout] is the timeout for the connection (retries if connection fails). [token] is the token for the Klipper instance.
  Klipper(
    this.host, {
    this.port = 7125,
    this.timeout = const Duration(seconds: 5),
    this.token,
  }) {
    _connect(timeout);
    _monitorConnection();
  }

  // Connect
  Future<void> _connect(Duration timeout) async {
    try {
      // Create WebSocket
      _ws = await WebSocket.connect(
        'ws://$host:$port/websocket${token != null ? '?token=$token' : ''}',
      ).timeout(timeout);
      // Create WebSocketChannel
      _wsc = IOWebSocketChannel(_ws!);
      // Connect to JSON-RPC
      _jsonRpc = Peer(_wsc!.cast<String>());
      await _registerEventListeners();
      unawaited(_jsonRpc.listen());
      // Update Status
      statusNotifier.status = await _getCurrentStatus();
    } catch (e) {
      statusNotifier.status = KlipperStatus.disconnected;
      if (!_closed) {
        Future.delayed(Duration.zero, () => _connect(timeout));
      }
    }
  }

  // Close
  /// Prevents the Klipper instance from reconnecting, and stops tracking events.
  Future<void> close() async {
    _closed = true;
  }

  // Status Checker
  Future<KlipperStatus> _getCurrentStatus() async {
    try {
      final Map status = await _jsonRpc
          .sendRequest('server.info')
          .timeout(const Duration(seconds: 1)) as Map;
      if (status['klippy_state'] == 'ready') {
        return KlipperStatus.ready;
      } else if (status['klippy_state'] == 'error' ||
          status['klippy_state'] == 'disconnected') {
        return KlipperStatus.error;
      } else if (status['klippy_state'] == 'startup') {
        return KlipperStatus.startup;
      } else if (status['klippy_state'] == 'shutdown') {
        return KlipperStatus.shutdown;
      } else if (status['klippy_state'] == 'initializing') {
        return KlipperStatus.initializing;
      }
    } catch (e) {
      return KlipperStatus.disconnected;
    }
    return KlipperStatus.disconnected;
  }

  // Update Status
  Future<void> _updateStatus() async {
    if (statusNotifier.status != KlipperStatus.disconnected) {
      statusNotifier.status = await _getCurrentStatus();
      if (statusNotifier.status == KlipperStatus.disconnected) {
        Future.delayed(Duration.zero, () => _connect(timeout));
      }
    }
  }

  // Monitoring Loop
  Future<void> _monitorConnection() async {
    while (!_closed) {
      await _updateStatus();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  // JSON-RPC
  Future<dynamic> _sendRequest(
    String method, {
    Map? params,
  }) async {
    if (statusNotifier.status == KlipperStatus.disconnected) {
      throw KlipperConnectionError('Not connected to Klipper');
    }
    try {
      return await _jsonRpc.sendRequest(method, params);
    } catch (e) {
      Future.delayed(Duration.zero, _updateStatus);
      return e;
    }
  }

  Future<dynamic> _sendNotification(
    String method, [
    Map? params,
  ]) async {
    if (statusNotifier.status == KlipperStatus.disconnected) {
      throw KlipperConnectionError('Not connected to Klipper');
    }
    _jsonRpc.sendNotification(method, params);
  }

  // User Facing Methods
  /// Sends a command of type [BaseCommand] to Klipper. Returns the parsed response.
  Future<dynamic> sendCommand(
    BaseCommand command,
  ) async {
    return command.parseResponse(
      await _sendRequest(command.method, params: command.parameters),
    );
  }

  /// Sends a notification of type [BaseCommand] to Klipper. Does not return a response.
  Future<void> sendNotification(
    BaseCommand command,
  ) async {
    return _sendNotification(command.method, command.parameters);
  }

  // Events
  Future<void> _registerEventListeners() async {
    // Klippy Status
    _jsonRpc.registerMethod('notify_klippy_ready', (params) {
      statusNotifier.status = KlipperStatus.ready;
    });
    _jsonRpc.registerMethod('notify_klippy_shutdown', (params) {
      statusNotifier.status = KlipperStatus.shutdown;
    });
    _jsonRpc.registerMethod('notify_klippy_disconnected', (params) async {
      statusNotifier.status = KlipperStatus.error;
    });
  }
}

/// Current Connection and Klippy Status
enum KlipperStatus {
  /// Klipper is connected and Klippy is ready.
  /// The server is read to receive commands.
  ready,

  /// Klipper is connected, but Klippy reports an error.
  /// Use [PrinterObjectsStatusCommand] with [PrintStatsStatusQuery] to retrieve the error message.
  error,

  /// Klipper is connected, but Klippy reports a startup state.
  /// This can be due to Klippy attempting to connect to the printer.
  startup,

  /// Klipper is connected, but Klippy reports a shutdown state.
  /// This can be due to a restart/shutdown, an emergency stop, or the printer being powered off.
  shutdown,

  /// Klipper is connected, but Klippy is still initializing.
  /// The server is not ready to receive commands, but should be ready soon.
  initializing,

  /// Klipper is not connected.
  /// Check if the server is running, and if the IP address and port are correct.
  disconnected
}
