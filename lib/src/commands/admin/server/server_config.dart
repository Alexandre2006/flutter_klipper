import 'package:flutter_klipper/src/commands/base.dart';

class ServerConfigurationCommand extends BaseCommand {
  @override
  String method = 'server.config';

  @override
  Map<String, dynamic> parameters = {};
}
