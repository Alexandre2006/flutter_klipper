import 'package:flutter_klipper/src/commands/command.dart';

class FirmwareRestartCommand extends BaseCommand {
  @override
  String method = 'printer.firmware_restart';

  @override
  Map<String, dynamic> parameters = {};
}
