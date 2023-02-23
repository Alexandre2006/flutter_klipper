import 'package:flutter_klipper/src/commands/base.dart';

class PerformFullUpdateCommand extends BaseCommand {
  @override
  String method = 'machine.update.full';

  @override
  Map<String, dynamic> parameters = {};
}
