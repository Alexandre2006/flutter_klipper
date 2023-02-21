import 'dart:async';
import 'dart:io';

import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Klipper {
  // Configuration
  String host;
  int port;
  String? token;

  // WebSocket
  WebSocketChannel? _ws;
  Duration timeout;

  // JSON-RPC
  late Client _jsonRpc;

  // Status
  KlipperStatus status = KlipperStatus.disconnected;
  bool _closed = false;

  // Constructor
  Klipper(this.host,
      {this.port = 7125,
      this.timeout = const Duration(seconds: 5),
      this.token}) {
    connect(timeout);
  }

  // WebSocket
  void close() {
    _closed = true;
    disconnect();
  }

  Future<void> connect(Duration timeout) async {
    try {
      if (_ws != null) {
        await _ws!.sink.close(1000, 'Flutter Klipper Reconnecting');
      }
      _ws = IOWebSocketChannel(
        await WebSocket.connect(
          'ws://$host:$port/websocket${token != null ? '?token=$token' : ''}',
        ).timeout(timeout),
      );
      _jsonRpc = Client(_ws!.cast<String>());
    } catch (e) {
      status = KlipperStatus.disconnected;
      if (!_closed) {
        Future.delayed(const Duration(seconds: 3), () => connect(timeout));
      }
    }
  }

  Future<void> disconnect() async {
    if (_ws != null) {
      await _ws!.sink.close(1000, 'Flutter Klipper Disconnecting');
    }
    status = KlipperStatus.disconnected;
  }

  
}

class KlipperConnectionError implements Exception {
  final String message;

  KlipperConnectionError(this.message);

  @override
  String toString() => "KlipperConnectionError: $message";
}

enum KlipperStatus { ready, error, startup, shutdown, disconnected }
