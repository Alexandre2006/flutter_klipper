import 'package:flutter_klipper/src/commands/command.dart';

class ShutdownMachineCommand extends BaseCommand {
  @override
  String method = 'machine.shutdown';

  @override
  Map<String, dynamic> parameters = {};
}
