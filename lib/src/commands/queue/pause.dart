import 'package:flutter_klipper/src/commands/command.dart';

class PauseQueueCommand extends BaseCommand {
  @override
  String method = 'server.job_queue.pause';

  @override
  Map<String, dynamic> parameters = {};
}
