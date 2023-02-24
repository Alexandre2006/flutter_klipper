import 'package:flutter_klipper/src/commands/base.dart';

class GetBatchSensorMeasurementsCommand extends JsonRPCCommand {
  @override
  String method = 'server.sensors.measurements';

  @override
  Map<String, dynamic> parameters = {};
}
