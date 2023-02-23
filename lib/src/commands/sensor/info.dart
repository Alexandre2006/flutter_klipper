import 'package:flutter_klipper/src/commands/base.dart';

class GetSensorInfoCommand extends BaseCommand {
  @override
  String method = 'server.sensors.info';

  @override
  Map<String, dynamic> parameters = {};

  GetSensorInfoCommand(String sensor) {
    parameters['sensor'] = sensor;
  }
}
