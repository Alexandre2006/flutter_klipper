import 'package:flutter_klipper/src/commands/base.dart';

class AvailablePrinterObjectsCommand extends JsonRPCCommand {
  @override
  String method = 'printer.objects.list';

  @override
  Map<String, dynamic> parameters = {};
}
