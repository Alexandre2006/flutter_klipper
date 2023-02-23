import 'package:flutter_klipper/src/commands/command.dart';

class UpdateSystemCommand extends BaseCommand {
  @override
  String method = 'machine.update.system';

  @override
  Map<String, dynamic> parameters = {};
}
