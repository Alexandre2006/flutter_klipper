import 'package:flutter_klipper/src/commands/base.dart';

class MoveFileCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.move';

  @override
  Map<String, dynamic> parameters = {};

  MoveFileCommand(String source, String destination) {
    parameters = {
      'source': source,
      'dest': destination,
    };
  }
}
