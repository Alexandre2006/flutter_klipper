import 'package:flutter_klipper/src/commands/base.dart';

class GetWebcamsCommand extends BaseCommand {
  @override
  String method = 'server.webcams.list';

  @override
  Map<String, dynamic> parameters = {};
}
