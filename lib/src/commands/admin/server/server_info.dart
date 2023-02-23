import 'package:flutter_klipper/src/commands/command.dart';

class ServerInfoCommand extends BaseCommand {
  @override
  String method = 'server.info';

  @override
  Map<String, dynamic> parameters = {};
}
