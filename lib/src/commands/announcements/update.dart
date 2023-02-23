import 'package:flutter_klipper/src/commands/command.dart';

class UpdateAnnouncementsCommand extends BaseCommand {
  @override
  String method = 'server.announcements.update';

  @override
  Map<String, dynamic> parameters = {};
}
