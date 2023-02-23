import 'package:flutter_klipper/src/commands/command.dart';

class StripOffCommand extends BaseCommand {
  @override
  String method = 'machine.wled.off';

  @override
  Map<String, dynamic> parameters = {};

  StripOffCommand(List<String> strips) {
    for (final strip in strips) {
      parameters[strip] = null;
    }
  }
}
