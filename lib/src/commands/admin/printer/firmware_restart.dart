import 'package:flutter_klipper/src/commands/base.dart';

class FirmwareRestartCommand extends BaseCommand {
  @override
  String method = 'printer.firmware_restart';

  @override
  Map<String, dynamic> parameters = {};
}
