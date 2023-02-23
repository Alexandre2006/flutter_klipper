import 'package:flutter_klipper/src/commands/base.dart';

class GetJobCommand extends BaseCommand {
  @override
  String method = 'server.history.get_job';

  @override
  Map<String, dynamic> parameters = {};

  GetJobCommand(int jobID) {
    parameters['uid'] = jobID;
  }
}
