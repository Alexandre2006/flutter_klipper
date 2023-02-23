import 'package:flutter_klipper/src/commands/command.dart';

@Deprecated('Use [IdentifyConnectionCommand] instead')
class WebSocketIDCommand extends BaseCommand {
  @override
  String method = 'server.websocket.id';

  @override
  Map<String, dynamic> parameters = {};
}
