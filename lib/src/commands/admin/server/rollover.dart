import 'package:flutter_klipper/src/commands/command.dart';

class RolloverLogsCommand extends BaseCommand {
  @override
  String method = 'server.logs.rollover';

  @override
  Map<String, dynamic> parameters = {};

  RolloverLogsCommand({
    RolloverApplication application = RolloverApplication.all,
  }) {
    if (application != RolloverApplication.all) {
      parameters['application'] = application.toString();
    }
  }
}

enum RolloverApplication { moonraker, klipper, all }