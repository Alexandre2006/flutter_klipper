import 'package:flutter_klipper/src/commands/command.dart';

class ClearHistoryCommand extends BaseCommand {
  @override
  String method = 'server.history.delete_job';

  @override
  Map<String, dynamic> parameters = {'all': true};
}
