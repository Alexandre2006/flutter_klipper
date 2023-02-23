import 'package:flutter_klipper/src/commands/base.dart';

class AvailablePrinterObjectsCommand extends BaseCommand {
  @override
  String method = 'printer.objects.list';

  @override
  Map<String, dynamic> parameters = {};
}
