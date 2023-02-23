import 'package:flutter_klipper/src/commands/command.dart';

class AvailablePrinterObjectsCommand extends BaseCommand {
  @override
  String method = 'printer.objects.list';

  @override
  Map<String, dynamic> parameters = {};
}
