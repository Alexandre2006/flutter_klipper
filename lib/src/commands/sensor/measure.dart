import 'package:flutter_klipper/src/commands/base.dart';

class GetSensorMeasurementsCommand extends BaseCommand {
  @override
  String method = 'server.sensors.measurements';

  @override
  Map<String, dynamic> parameters = {};

  GetSensorMeasurementsCommand(String sensor) {
    parameters['sensor'] = sensor;
  }
}
