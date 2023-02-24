import 'package:flutter_klipper/src/commands/base.dart';

class DeleteDirectoryCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.delete_directory';

  @override
  Map<String, dynamic> parameters = {};

  DeleteDirectoryCommand(String directory, {bool force = false}) {
    parameters = {
      'directory': directory,
      'force': force,
    };
  }
}
