import 'package:flutter_klipper/src/commands/base.dart';

class MachineRebootCommand extends BaseCommand {
  @override
  String method = 'machine.reboot';

  @override
  Map<String, dynamic> parameters = {};
}
