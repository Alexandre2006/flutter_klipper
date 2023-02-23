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

/// Power states for Klipper \[power\] components
enum PowerState {
  /// Turns the device on
  on,

  /// Turns the device off
  off,

  /// Toggles the device on or off
  toggle
}
