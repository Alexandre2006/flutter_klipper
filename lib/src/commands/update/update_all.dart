import 'package:flutter_klipper/src/commands/command.dart';

class PerformFullUpdateCommand extends BaseCommand {
  @override
  String method = 'machine.update.full';

  @override
  Map<String, dynamic> parameters = {};
}
