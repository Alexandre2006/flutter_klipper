import 'package:flutter_klipper/src/commands/command.dart';

class RemoveAnnouncementFeedCommand extends BaseCommand {
  @override
  String method = 'server.announcements.delete_feed';

  @override
  Map<String, dynamic> parameters = {};

  RemoveAnnouncementFeedCommand(String name) {
    parameters['name'] = name;
  }
}