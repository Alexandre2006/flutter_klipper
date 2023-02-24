import 'package:flutter_klipper/src/commands/base.dart';

class RemoveJobCommand extends JsonRPCCommand {
  @override
  String method = 'server.job_queue.delete_job';

  @override
  Map<String, dynamic> parameters = {};

  RemoveJobCommand(List<String> jobIDs) {
    parameters = {
      'job_ids': jobIDs,
    };
  }
}
