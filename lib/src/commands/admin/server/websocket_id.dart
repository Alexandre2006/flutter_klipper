import 'package:flutter_klipper/src/commands/base.dart';

@Deprecated('Use [IdentifyConnectionCommand] instead')
class WebSocketIDCommand extends JsonRPCCommand {
  @override
  String method = 'server.websocket.id';

  @override
  Map<String, dynamic> parameters = {};
}
