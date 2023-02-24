import 'package:flutter_klipper/src/commands/base.dart';

class RunGCodeCommand extends JsonRPCCommand {
  @override
  String method = 'printer.gcode.script';

  @override
  Map<String, dynamic> parameters = {};

  RunGCodeCommand(String gcode) {
    parameters = {
      'script': gcode,
    };
  }
}
