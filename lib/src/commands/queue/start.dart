import 'package:flutter_klipper/src/commands/base.dart';

class StartQueueCommand extends JsonRPCCommand {
  @override
  String method = 'server.job_queue.start';

  @override
  Map<String, dynamic> parameters = {};
}
