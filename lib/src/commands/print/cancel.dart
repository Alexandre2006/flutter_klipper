import 'package:flutter_klipper/src/commands/command.dart';

class CancelPrintCommand extends BaseCommand {
  @override
  String method = 'printer.print.cancel';

  @override
  Map<String, dynamic> parameters = {};
}
