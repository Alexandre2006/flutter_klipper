import 'package:flutter_klipper/src/commands/command.dart';

class RestartCommand extends BaseCommand {
  @override
  String method = 'server.restart';

  @override
  Map<String, dynamic> parameters = {};
}

enum RolloverApplication { moonraker, klipper, all }
