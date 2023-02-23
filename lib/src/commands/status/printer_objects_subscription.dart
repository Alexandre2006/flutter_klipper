import 'package:flutter_klipper/src/commands/command.dart';

class PrinterObjectsSubscribeCommand extends BaseCommand {
  @override
  String method = 'printer.objects.subscribe';

  // TODO: make it so user can select which objects to query, and what fields to query

  @override
  Map<String, dynamic> parameters = {};
}

class PrinterObjectsUnSubscribeCommand extends BaseCommand {
  @override
  String method = 'printer.objects.subscribe';

  @override
  Map<String, dynamic> parameters = {"objects": null};
}
