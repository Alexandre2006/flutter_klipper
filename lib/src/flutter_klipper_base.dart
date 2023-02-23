import 'dart:async';
import 'dart:io';

import 'package:flutter_klipper/src/commands/command.dart';
import 'package:flutter_klipper/src/commands/status/printer_objects.dart';
import 'package:flutter_klipper/src/commands/status/printer_objects_status.dart';
import 'package:flutter_klipper/src/errors/klipper_conn_err.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// TODO:
// - Commands:
//   - Basic Implementation
//   - Parser for all retunrs
//   - Write Tests for all commands
//   - Documentation for All
// - File Operations:
//   - Basic Implementation
//   - Parser for all retunrs
//   - Write Tests for all commands
//   - Documentation for All
// - Events:
//   - Klipper Status (Disconnected/Connected)
//   - Klippy Status (Ready/Error/Shutdown/Startup/Initializing)
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

class Klipper {
  // Configuration
  String host;
  int port;
  String? token;

  // WebSocket
  WebSocketChannel? wsc;
  WebSocket? ws;
  Duration timeout;

  // JSON-RPC
  late Client _jsonRpc;

  // Status
  KlipperStatus status = KlipperStatus.disconnected;
  bool _closed = false;

  // Constructor
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
      ws = await WebSocket.connect(
        'ws://$host:$port/websocket${token != null ? '?token=$token' : ''}',
      ).timeout(timeout);
      // Create WebSocketChannel
      wsc = IOWebSocketChannel(ws!);
      // Connect to JSON-RPC
      _jsonRpc = Client(wsc!.cast<String>());
      unawaited(_jsonRpc.listen());
      // Update Status
      status = await _getCurrentStatus();
    } catch (e) {
      status = KlipperStatus.disconnected;
      if (!_closed) {
        Future.delayed(Duration.zero, () => _connect(timeout));
      }
    }
  }

  // Close
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
    if (status != KlipperStatus.disconnected) {
      status = await _getCurrentStatus();
      if (status == KlipperStatus.disconnected) {
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
    if (status == KlipperStatus.disconnected) {
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
    List<dynamic>? params,
  ]) async {
    if (status == KlipperStatus.disconnected) {
      throw KlipperConnectionError('Not connected to Klipper');
    }
    _jsonRpc.sendNotification(method, params);
  }

  // User Facing Methods
  Future<dynamic> sendCommand(
    BaseCommand command, {
    Map? params,
  }) async {
    return command.parseResponse(
      await _sendRequest(command.method, params: command.parameters),
    );
  }

  Future<void> sendNotification(
    BaseCommand command, [
    List<dynamic>? params,
  ]) async {
    return _sendNotification(command.method, params);
  }
}

enum KlipperStatus {
  ready,
  error,
  startup,
  shutdown,
  initializing,
  disconnected
}
