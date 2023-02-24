import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_klipper/src/commands/base.dart';
import 'package:flutter_klipper/src/errors/klipper_conn_err.dart';
import 'package:flutter_klipper/src/services/status_notifiers.dart';
import 'package:http/http.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// TODO:
// - Commands:
//   - Parser for all returns (+ better error handling)
//   - Write Tests for all commands
//   - Documentation for All
// - File Operations:
//   - Parser for all retunrs (+ better error handling)
//   - Write Tests for all commands
//   - Documentation for All
// - Events:
//   - Parser for events (all)
//   - Write Tests for (all) events
//   - Documentation For All

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

  // Events
  final StreamController _subscriptionEventController =
      StreamController.broadcast();
  final StreamController _gcodeResponseEventController =
      StreamController.broadcast();
  final StreamController _fileChangedEventController =
      StreamController.broadcast();
  final StreamController _updateManagerResponseEventController =
      StreamController.broadcast();
  final StreamController _updateManagerRefreshedEventController =
      StreamController.broadcast();
  final StreamController _throttlingEventController =
      StreamController.broadcast();
  final StreamController _moonrakerStatsEventController =
      StreamController.broadcast();
  final StreamController _historyEventController = StreamController.broadcast();
  final StreamController _userCreatedEventController =
      StreamController.broadcast();
  final StreamController _userDeletedEventController =
      StreamController.broadcast();
  final StreamController _userLoggedOutEventController = StreamController();
  final StreamController _serviceStateChangedEventController =
      StreamController();
  final StreamController _jobQueueEventController = StreamController();
  final StreamController _buttonEventController = StreamController();
  final StreamController _announcementUpdatedEventController =
      StreamController();
  final StreamController _announcementDismissedEventController =
      StreamController();
  final StreamController _announcementWakeEventController = StreamController();
  final StreamController _sudoAlertEventController = StreamController();
  final StreamController _agentEventController = StreamController();
  final StreamController _sensorEventController = StreamController();

  /// Stream for monitoring subscription events from printer objects.
  Stream get onBroadcastEvent => _subscriptionEventController.stream;

  /// Stream for monitoring GCode responses.
  Stream get onGCodeResponseEvent => _gcodeResponseEventController.stream;

  /// Stream for monitoring file changes.
  Stream get onFileChangedEvent => _fileChangedEventController.stream;

  /// Stream for monitoring Update Manager responses (during client updates).
  Stream get onUpdateManagerResponseEvent =>
      _updateManagerResponseEventController.stream;

  /// Stream for monitoring Update Manager refreshes.
  Stream get onUpdateManagerRefreshedEvent =>
      _updateManagerRefreshedEventController.stream;

  /// Stream for monitoring CPU throttling events.
  Stream get onThrottlingEvent => _throttlingEventController.stream;

  /// Stream for monitoring Moonraker stats.
  Stream get onMoonrakerStatsEvent => _moonrakerStatsEventController.stream;

  /// Stream for monitoring history events.
  Stream get onHistoryEvent => _historyEventController.stream;

  /// Stream for monitoring user creation events.
  Stream get onUserCreatedEvent => _userCreatedEventController.stream;

  /// Stream for monitoring user deletion events.
  Stream get onUserDeletedEvent => _userDeletedEventController.stream;

  /// Stream for monitoring user logout events.
  Stream get onUserLoggedOutEvent => _userLoggedOutEventController.stream;

  /// Stream for monitoring service state changes.
  Stream get onServiceStateChangedEvent =>
      _serviceStateChangedEventController.stream;

  /// Stream for monitoring job queue events.
  Stream get onJobQueueEvent => _jobQueueEventController.stream;

  /// Stream for monitoring button events.
  Stream get onButtonEvent => _buttonEventController.stream;

  /// Stream for monitoring announcement updates.
  Stream get onAnnouncementUpdatedEvent =>
      _announcementUpdatedEventController.stream;

  /// Stream for monitoring announcement dismissals.
  Stream get onAnnouncementDismissedEvent =>
      _announcementDismissedEventController.stream;

  /// Stream for monitoring announcement wake events.
  Stream get onAnnouncementWakeEvent => _announcementWakeEventController.stream;

  /// Stream for monitoring sudo alerts.
  Stream get onSudoAlertEvent => _sudoAlertEventController.stream;

  /// Stream for monitoring agent events.
  Stream get onAgentEvent => _agentEventController.stream;

  /// Stream for monitoring sensor events.
  Stream get onSensorEvent => _sensorEventController.stream;

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
      await Future.delayed(const Duration(milliseconds: 250));
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
  /// Sends a command of type [JsonRPCCommand] to Klipper. Returns the parsed response.
  Future<dynamic> sendCommand(
    JsonRPCCommand command,
  ) async {
    return command.parseResponse(
      await _sendRequest(command.method, params: command.parameters),
    );
  }

  /// Sends a notification of type [JsonRPCCommand] to Klipper. Does not return a response.
  Future<void> sendNotification(
    JsonRPCCommand command,
  ) async {
    return _sendNotification(command.method, command.parameters);
  }

  // File Commands
  Future<dynamic> _getFile(String path) async {
    // Download file at path
    final Uri uri = Uri.parse('http://$host:$port$path');
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw KlipperConnectionError('Failed to download file');
    }
  }

  Future<int> uploadFile(
    List<int> data, {
    required String filename,
    String root = "gcodes",
    String? path,
    String? checksum,
    bool printGCode = false,
  }) async {
    // Create Uri
    final Uri uri = Uri.parse('http://$host:$port/server/files/upload');

    // Create Request
    final MultipartRequest multipartRequest = MultipartRequest('POST', uri);
    multipartRequest.files.add(
      MultipartFile.fromBytes(
        'file',
        data,
        filename: filename,
      ),
    );

    // Add Fields
    multipartRequest.fields['root'] = root;
    multipartRequest.fields['print'] = 'true';
    if (path != null) {
      multipartRequest.fields['path'] = path;
    }
    if (checksum != null) {
      multipartRequest.fields['checksum'] = checksum;
    }

    // Send Data
    final StreamedResponse streamedResponse = await multipartRequest.send();

    // Check for success (201)
    if (streamedResponse.statusCode == 201) {
      return streamedResponse.statusCode;
    } else {
      throw KlipperConnectionError('Failed to upload file');
    }
  }

  /// Gets a file from the Klipper instance. [path] is the path of the file to get.
  Future<dynamic> getFile(String path) async {
    return _getFile("/server/files/$path");
  }

  /// Gets the Klipper log from the Klipper instance.
  Future<dynamic> getKlippyLog() async {
    return getFile("klippy.log");
  }

  /// Gets the Moonraker log from the Klipper instance.
  Future<dynamic> getMoonrakerLog() async {
    return getFile("moonraker.log");
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

    // Broadcast Events
    _jsonRpc.registerMethod('notify_status_update', (params) {
      _subscriptionEventController.add(params);
    });

    // GCode Response Events
    _jsonRpc.registerMethod('notify_gcode_response', (params) {
      _gcodeResponseEventController.add(params);
    });

    // File Events
    _jsonRpc.registerMethod('notify_filelist_changed', (params) {
      _fileChangedEventController.add(params);
    });

    // Update Manager Events
    _jsonRpc.registerMethod('notify_update_response', (params) {
      _updateManagerResponseEventController.add(params);
    });

    // Update Manager Refresh Events
    _jsonRpc.registerMethod('notify_update_refreshed', (params) {
      _updateManagerRefreshedEventController.add(params);
    });

    // CPU Throttling Events
    _jsonRpc.registerMethod('notify_cpu_throttled', (params) {
      _throttlingEventController.add(params);
    });

    // Moonraker Stats Events
    _jsonRpc.registerMethod('notify_proc_stat_update', (params) {
      _moonrakerStatsEventController.add(params);
    });

    // History Events
    _jsonRpc.registerMethod('notify_history_changed', (params) {
      _historyEventController.add(params);
    });

    // User Created Events
    _jsonRpc.registerMethod('notify_user_created', (params) {
      _userCreatedEventController.add(params);
    });

    // User Deleted Events
    _jsonRpc.registerMethod('notify_user_deleted', (params) {
      _userDeletedEventController.add(params);
    });

    // User Log Out Events
    _jsonRpc.registerMethod('notify_user_logged_out', (params) {
      _userLoggedOutEventController.add(params);
    });

    // Service State Changed Event
    _jsonRpc.registerMethod('notify_service_state_changed', (params) {
      _serviceStateChangedEventController.add(params);
    });

    // Job Queue Events
    _jsonRpc.registerMethod('notify_job_queue_changed', (params) {
      _jobQueueEventController.add(params);
    });

    // Button Events
    _jsonRpc.registerMethod('notify_button_event', (params) {
      _buttonEventController.add(params);
    });

    // Announcement Updated Events
    _jsonRpc.registerMethod('notify_announcement_update', (params) {
      _announcementUpdatedEventController.add(params);
    });

    // Announcement Dismissed Events
    _jsonRpc.registerMethod('notify_announcement_dismissed', (params) {
      _announcementDismissedEventController.add(params);
    });

    // Announcement Wake Events
    _jsonRpc.registerMethod('notify_announcement_wake', (params) {
      _announcementWakeEventController.add(params);
    });

    // Sudo Alert Events
    _jsonRpc.registerMethod('notify_sudo_alert', (params) {
      _sudoAlertEventController.add(params);
    });

    // Agent Events
    _jsonRpc.registerMethod('notify_agent_event', (params) {
      _agentEventController.add(params);
    });

    // Sensor Events
    _jsonRpc.registerMethod('sensors:sensor_update', (params) {
      _sensorEventController.add(params);
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
