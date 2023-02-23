import 'package:flutter_klipper/src/commands/base.dart';

class PausePrintCommand extends BaseCommand {
  @override
  String method = 'printer.print.pause';

  @override
  Map<String, dynamic> parameters = {};
}
