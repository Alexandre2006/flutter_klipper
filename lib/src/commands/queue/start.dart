import 'package:flutter_klipper/src/commands/base.dart';

class StartQueueCommand extends BaseCommand {
  @override
  String method = 'server.job_queue.start';

  @override
  Map<String, dynamic> parameters = {};
}
