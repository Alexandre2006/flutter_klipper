import 'package:flutter_klipper/src/commands/base.dart';

class CachedTemperatureDataCommand extends BaseCommand {
  @override
  String method = 'server.temperature_store';

  @override
  Map<String, dynamic> parameters = {};
}
