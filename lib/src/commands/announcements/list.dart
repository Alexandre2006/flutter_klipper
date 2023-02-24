import 'package:flutter_klipper/src/commands/base.dart';

class ListAnnouncementsCommand extends JsonRPCCommand {
  @override
  String method = 'server.announcements.list';

  @override
  Map<String, dynamic> parameters = {};

  ListAnnouncementsCommand({bool includeDismissed = false}) {
    parameters = {
      'include_dismissed': includeDismissed,
    };
  }
}
