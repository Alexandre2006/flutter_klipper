import 'package:flutter_klipper/src/commands/base.dart';

class StripToggleCommand extends JsonRPCCommand {
  @override
  String method = 'machine.wled.toggle';

  @override
  Map<String, dynamic> parameters = {};

  StripToggleCommand(List<String> strips) {
    for (final strip in strips) {
      parameters[strip] = null;
    }
  }
}
