import 'package:flutter_klipper/src/commands/base.dart';

class PauseQueueCommand extends JsonRPCCommand {
  @override
  String method = 'server.job_queue.pause';

  @override
  Map<String, dynamic> parameters = {};
}
