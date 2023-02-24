import 'package:flutter_klipper/src/commands/base.dart';

class CopyFileCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.copy';

  @override
  Map<String, dynamic> parameters = {};

  CopyFileCommand(String source, String destination) {
    parameters = {
      'source': source,
      'dest': destination,
    };
  }
}
