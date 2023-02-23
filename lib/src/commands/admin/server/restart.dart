import 'package:flutter_klipper/src/commands/base.dart';

class RestartCommand extends BaseCommand {
  @override
  String method = 'server.restart';

  @override
  Map<String, dynamic> parameters = {};
}
