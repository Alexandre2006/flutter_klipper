import 'package:flutter_klipper/src/commands/command.dart';

class CachedGCodeResponsesCommand extends BaseCommand {
  @override
  String method = 'server.temperature_store';

  @override
  Map<String, dynamic> parameters = {};

  CachedGCodeResponsesCommand(int count) {
    parameters['count'] = count;
  }
}
