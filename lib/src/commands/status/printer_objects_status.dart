import 'package:flutter_klipper/src/commands/command.dart';

class PrinterObjectsStatusCommand extends BaseCommand {
  @override
  String method = 'printer.objects.query';

  // TODO: make it so user can select which objects to query, and what fields to query

  @override
  Map<String, dynamic> parameters = {};
}
