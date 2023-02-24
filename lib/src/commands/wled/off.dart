import 'package:flutter_klipper/src/commands/base.dart';

class StripOffCommand extends JsonRPCCommand {
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
