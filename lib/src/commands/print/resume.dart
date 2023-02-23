import 'package:flutter_klipper/src/commands/command.dart';

class ResumePrintCommand extends BaseCommand {
  @override
  String method = 'printer.print.resume';

  @override
  Map<String, dynamic> parameters = {};
}
