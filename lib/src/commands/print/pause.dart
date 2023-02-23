import 'package:flutter_klipper/src/commands/command.dart';

class PausePrintCommand extends BaseCommand {
  @override
  String method = 'printer.print.pause';

  @override
  Map<String, dynamic> parameters = {};
}
