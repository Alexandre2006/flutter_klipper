import 'package:flutter_klipper/src/commands/base.dart';

class RetrieveJobQueueStatusCommand extends BaseCommand {
  @override
  String method = 'server.job_queue.status';

  @override
  Map<String, dynamic> parameters = {};
}
