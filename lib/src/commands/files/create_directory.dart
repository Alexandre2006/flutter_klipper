import 'package:flutter_klipper/src/commands/base.dart';

class CreateDirectoryCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.post_directory';

  @override
  Map<String, dynamic> parameters = {};

  CreateDirectoryCommand(String path) {
    parameters = {
      'path': path,
    };
  }
}
