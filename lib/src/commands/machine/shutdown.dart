import 'package:flutter_klipper/src/commands/base.dart';

class ShutdownMachineCommand extends JsonRPCCommand {
  @override
  String method = 'machine.shutdown';

  @override
  Map<String, dynamic> parameters = {};
}
