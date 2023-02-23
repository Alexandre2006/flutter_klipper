import 'package:flutter_klipper/src/commands/base.dart';

class GetDeviceStatusCommand extends BaseCommand {
  @override
  String method = 'machine.device_power.get_device';

  @override
  Map<String, dynamic> parameters = {};

  GetDeviceStatusCommand(String device) {
    parameters['device'] = device;
  }
}
