import 'package:flutter_klipper/src/commands/base.dart';

class StripOnCommand extends BaseCommand {
  @override
  String method = 'machine.wled.on';

  @override
  Map<String, dynamic> parameters = {};

  StripOnCommand(List<String> strips) {
    for (final strip in strips) {
      parameters[strip] = null;
    }
  }
}
