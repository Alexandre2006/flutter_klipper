import 'package:flutter_klipper/src/commands/base.dart';

class ListAnnouncementFeedsCommand extends BaseCommand {
  @override
  String method = 'server.announcements.feeds';

  @override
  Map<String, dynamic> parameters = {};
}
