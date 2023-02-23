import 'package:flutter_klipper/src/commands/base.dart';

class DeleteJobFromHistoryCommand extends BaseCommand {
  @override
  String method = 'server.history.delete_job';

  @override
  Map<String, dynamic> parameters = {};

  DeleteJobFromHistoryCommand(int jobID) {
    parameters['uid'] = jobID;
  }
}
