import 'package:flutter_klipper/src/commands/base.dart';

class SetDeviceStateCommand extends BaseCommand {
  @override
  String method = 'machine.device_power.post_device';

  @override
  Map<String, dynamic> parameters = {};

  SetDeviceStateCommand(String device, PowerState state) {
    parameters['device'] = device;
    parameters['action'] = state.toString();
  }
}

enum PowerState { on, off, toggle }
