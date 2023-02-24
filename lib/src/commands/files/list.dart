import 'package:flutter_klipper/src/commands/base.dart';

class ListFilesCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.list';

  @override
  Map<String, dynamic> parameters = {};

  ListFilesCommand(String? root) {
    if (root != null) {
      parameters = {
        'root': root,
      };
    }
  }
}
