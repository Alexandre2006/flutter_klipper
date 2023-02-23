import 'package:flutter_klipper/src/commands/base.dart';

class CancelPrintCommand extends BaseCommand {
  @override
  String method = 'printer.print.cancel';

  @override
  Map<String, dynamic> parameters = {};
}
