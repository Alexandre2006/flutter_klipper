import 'package:flutter_klipper/src/commands/command.dart';

class GCodeHelpCommand extends BaseCommand {
  @override
  String method = 'printer.gcode.help';

  @override
  Map<String, dynamic> parameters = {};
}
