import 'package:flutter_klipper/src/commands/command.dart';

class GetSensorsCommand extends BaseCommand {
  @override
  String method = 'server.sensors.list';

  @override
  Map<String, dynamic> parameters = {};
}
