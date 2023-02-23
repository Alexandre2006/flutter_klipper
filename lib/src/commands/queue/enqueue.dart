import 'package:flutter_klipper/src/commands/command.dart';

class EnqueueJobsCommand extends BaseCommand {
  @override
  String method = 'server.job_queue.post_job';

  @override
  Map<String, dynamic> parameters = {};

  EnqueueJobsCommand(List<String> filenames, {bool reset = false}) {
    parameters = {
      'filenames': filenames,
      'reset': reset,
    };
  }
}
