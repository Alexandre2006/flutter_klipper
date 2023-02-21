import 'dart:io';

class Klipper {
  // Configuration
  String host;
  int port;
  String? token;

  // WebSocket
  late WebSocket _ws;

  // Status
  KlipperStatus status = KlipperStatus.disconnected;
  bool _closed = false;

  // Constructor
  Klipper(this.host, {this.port = 7125, this.token}) {
    _connect();
  }

  // WebSocket
  void close() {
    _closed = true;
    disconnect();
  }

  Future<void> _connect() async {
    try {
      _ws = await WebSocket.connect(
        'ws://$host:$port/websocket${token != null ? '?token=$token' : ''}',
      );
    } on SocketException {
      status = KlipperStatus.disconnected;
      if (!_closed) {
        Future.delayed(const Duration(seconds: 3), () => connect());
      }
    }
  }

  Future<void> connect() async {
    if (_ws.readyState == WebSocket.open ||
        _ws.readyState == WebSocket.connecting) {
      await _ws.close(1000, 'Flutter Klipper Reconnecting');
    }
    _connect();
  }

  Future<void> disconnect() async {
    if (_ws.readyState == WebSocket.open ||
        _ws.readyState == WebSocket.connecting) {
      await _ws.close(1000, 'Flutter Klipper Disconnecting');
    }
    status = KlipperStatus.disconnected;
  }

  Future<void> getInitialState() async {}

  void registerStatusListeners() {
    _ws.listen((event) {
      print(event);
    });
  }
}

class KlipperConnectionError implements Exception {
  final String message;

  KlipperConnectionError(this.message);

  @override
  String toString() => "KlipperConnectionError: $message";
}

enum KlipperStatus { ready, error, startup, shutdown, disconnected }
