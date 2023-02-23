import 'package:flutter_klipper/src/commands/command.dart';

class GetBatchSensorMeasurementsCommand extends BaseCommand {
  @override
  String method = 'server.sensors.measurements';

  @override
  Map<String, dynamic> parameters = {};
}
