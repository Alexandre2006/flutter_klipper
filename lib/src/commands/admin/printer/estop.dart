import 'package:flutter_klipper/src/commands/base.dart';

class EmergencyStopCommand extends BaseCommand {
  @override
  String method = 'printer.emergency_stop';

  @override
  Map<String, dynamic> parameters = {};
}
