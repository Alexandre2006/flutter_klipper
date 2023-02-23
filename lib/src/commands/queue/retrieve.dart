import 'package:flutter_klipper/src/commands/command.dart';

class RetrieveJobQueueStatusCommand extends BaseCommand {
  @override
  String method = 'server.job_queue.status';

  @override
  Map<String, dynamic> parameters = {};
}
