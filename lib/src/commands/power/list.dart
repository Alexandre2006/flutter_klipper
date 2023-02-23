import 'package:flutter_klipper/src/commands/command.dart';

class GetDeviceListCommand extends BaseCommand {
  @override
  String method = 'machine.device_power.devices';

  @override
  Map<String, dynamic> parameters = {};
}
