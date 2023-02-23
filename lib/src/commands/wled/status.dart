import 'package:flutter_klipper/src/commands/command.dart';

class GetStripStatusCommand extends BaseCommand {
  @override
  String method = 'machine.wled.status';

  @override
  Map<String, dynamic> parameters = {};

  GetStripStatusCommand(List<String> stripNames) {
    for (final stripName in stripNames) {
      parameters[stripName] = null;
    }
  }
}
