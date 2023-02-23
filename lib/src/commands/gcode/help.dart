import 'package:flutter_klipper/src/commands/base.dart';

class GCodeHelpCommand extends BaseCommand {
  @override
  String method = 'printer.gcode.help';

  @override
  Map<String, dynamic> parameters = {};
}
