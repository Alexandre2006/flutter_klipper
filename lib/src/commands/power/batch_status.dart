import 'package:flutter_klipper/src/commands/base.dart';

class GetBatchDeviceStatusCommand extends JsonRPCCommand {
  @override
  String method = 'machine.device_power.status';

  @override
  Map<String, dynamic> parameters = {};

  GetBatchDeviceStatusCommand(List<String> devices) {
    for (final element in devices) {
      parameters[element] = null;
    }
  }
}
