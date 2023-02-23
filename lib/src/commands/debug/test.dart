import 'package:flutter_klipper/src/commands/command.dart';

class DebugTestNotifierCommand extends BaseCommand {
  @override
  String method = 'debug.notifiers.test';

  @override
  Map<String, dynamic> parameters = {};

  DebugTestNotifierCommand(String name) {
    parameters['name'] = name;
  }
}
