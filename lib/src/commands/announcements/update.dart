import 'package:flutter_klipper/src/commands/base.dart';

class UpdateAnnouncementsCommand extends JsonRPCCommand {
  @override
  String method = 'server.announcements.update';

  @override
  Map<String, dynamic> parameters = {};
}
