import 'package:flutter_klipper/src/commands/base.dart';

class BatchSetDeviceOffCommand extends JsonRPCCommand {
  @override
  String method = 'machine.device_power.off';

  @override
  Map<String, dynamic> parameters = {};

  BatchSetDeviceOffCommand(List<String> devices) {
    for (final element in devices) {
      parameters[element] = null;
    }
  }
}
