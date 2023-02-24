import 'package:flutter_klipper/src/commands/base.dart';

class RolloverLogsCommand extends JsonRPCCommand {
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
