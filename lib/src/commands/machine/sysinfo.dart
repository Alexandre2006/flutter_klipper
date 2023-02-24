import 'package:flutter_klipper/src/commands/base.dart';

class SystemInfoCommand extends JsonRPCCommand {
  @override
  String method = 'machine.system_info';

  @override
  Map<String, dynamic> parameters = {};
}
