import 'package:flutter_klipper/src/commands/base.dart';

class JobQueueJumpCommand extends BaseCommand {
  @override
  String method = 'server.job_queue.jump';

  @override
  Map<String, dynamic> parameters = {};

  JobQueueJumpCommand(int jobID) {
    parameters['job_id'] = jobID;
  }
}
