import 'package:flutter_klipper/src/commands/base.dart';

class DebugTestNotifierCommand extends JsonRPCCommand {
  @override
  String method = 'debug.notifiers.test';

  @override
  Map<String, dynamic> parameters = {};

  DebugTestNotifierCommand(String name) {
    parameters['name'] = name;
  }
}
