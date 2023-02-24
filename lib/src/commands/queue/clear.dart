import 'package:flutter_klipper/src/commands/base.dart';

class ClearJobsCommand extends JsonRPCCommand {
  @override
  String method = 'server.job_queue.delete_job';

  @override
  Map<String, dynamic> parameters = {'all': true};
}
