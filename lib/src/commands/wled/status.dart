import 'package:flutter_klipper/src/commands/base.dart';

class GetStripStatusCommand extends JsonRPCCommand {
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
