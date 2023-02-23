import 'package:flutter_klipper/src/commands/command.dart';

class GetJobTotalsCommand extends BaseCommand {
  @override
  String method = 'server.history.totals';

  @override
  Map<String, dynamic> parameters = {};
}
