import 'package:flutter_klipper/src/commands/command.dart';

class AddAnnouncementFeedCommand extends BaseCommand {
  @override
  String method = 'server.announcements.post_feed';

  @override
  Map<String, dynamic> parameters = {};

  AddAnnouncementFeedCommand(String name) {
    parameters['name'] = name;
  }
}
