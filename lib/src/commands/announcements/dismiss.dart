import 'package:flutter_klipper/src/commands/base.dart';

class DismissAnnouncementCommand extends JsonRPCCommand {
  @override
  String method = 'server.announcements.dismiss';

  @override
  Map<String, dynamic> parameters = {};

  DismissAnnouncementCommand({required String entryID, int? wakeTime}) {
    parameters['entry_id'] = entryID;
    if (wakeTime != null) {
      parameters['wake_time'] = wakeTime;
    }
  }
}
