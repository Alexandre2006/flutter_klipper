import 'package:flutter_klipper/src/commands/base.dart';

class ServerInfoCommand extends BaseCommand {
  @override
  String method = 'server.info';

  @override
  Map<String, dynamic> parameters = {};
}
