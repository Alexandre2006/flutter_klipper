import 'package:flutter_klipper/src/commands/command.dart';

class RunGCodeCommand extends BaseCommand {
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
