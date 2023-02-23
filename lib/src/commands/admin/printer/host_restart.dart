import 'package:flutter_klipper/src/commands/base.dart';

class HostRestartCommand extends BaseCommand {
  @override
  String method = 'printer.restart';

  @override
  Map<String, dynamic> parameters = {};
}
