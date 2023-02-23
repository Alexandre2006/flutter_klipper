import 'package:flutter_klipper/src/commands/command.dart';

class ResetJobTotalsCommand extends BaseCommand {
  @override
  String method = 'server.history.reset_totals';

  @override
  Map<String, dynamic> parameters = {};
}
