import 'package:flutter_klipper/src/commands/base.dart';

class GetDirectoryInfoCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.get_directory';

  @override
  Map<String, dynamic> parameters = {};

  GetDirectoryInfoCommand(String? path, {bool extended = false}) {
    if (path != null) {
      parameters = {
        'path': path,
        'extended': extended,
      };
    } else {
      parameters = {
        'extended': extended,
      };
    }
  }
}
