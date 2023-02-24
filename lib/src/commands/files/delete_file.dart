import 'package:flutter_klipper/src/commands/base.dart';

class DeleteFileCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.delete_file';

  @override
  Map<String, dynamic> parameters = {};

  DeleteFileCommand(String path) {
    parameters = {
      'path': path,
    };
  }
}
