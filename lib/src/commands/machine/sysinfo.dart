import 'package:flutter_klipper/src/commands/command.dart';

class SystemInfoCommand extends BaseCommand {
  @override
  String method = 'machine.system_info';

  @override
  Map<String, dynamic> parameters = {};
}