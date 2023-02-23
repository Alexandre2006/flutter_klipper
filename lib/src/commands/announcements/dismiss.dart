import 'package:flutter_klipper/src/commands/command.dart';

class DismissAnnouncementCommand extends BaseCommand {
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
