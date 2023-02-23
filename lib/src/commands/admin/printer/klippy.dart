import 'package:flutter_klipper/src/commands/command.dart';

class KlippyHostInfoCommand extends BaseCommand {
  @override
  String method = 'printer.info';

  @override
  Map<String, dynamic> parameters = {};
}
