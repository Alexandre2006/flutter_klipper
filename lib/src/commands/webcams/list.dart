import 'package:flutter_klipper/src/commands/command.dart';

class GetWebcamsCommand extends BaseCommand {
  @override
  String method = 'server.webcams.list';

  @override
  Map<String, dynamic> parameters = {};
}
