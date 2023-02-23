import 'package:flutter_klipper/src/commands/base.dart';

class BatchSetDeviceOnCommand extends BaseCommand {
  @override
  String method = 'machine.device_power.on';

  @override
  Map<String, dynamic> parameters = {};

  BatchSetDeviceOnCommand(List<String> devices) {
    for (final element in devices) {
      parameters[element] = null;
    }
  }
}
