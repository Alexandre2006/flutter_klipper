import 'package:flutter_klipper/src/commands/base.dart';

class KlippyHostInfoCommand extends BaseCommand {
  @override
  String method = 'printer.info';

  @override
  Map<String, dynamic> parameters = {};
}
