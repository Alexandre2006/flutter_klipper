import 'package:flutter_klipper/src/commands/command.dart';

class UpdateMoonrakerCommand extends BaseCommand {
  @override
  String method = 'machine.update.moonraker';

  @override
  Map<String, dynamic> parameters = {};
}
