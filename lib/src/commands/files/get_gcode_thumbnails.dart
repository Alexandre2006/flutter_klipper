import 'package:flutter_klipper/src/commands/base.dart';

class GetGCodeThumbnailsCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.thumbnails';

  @override
  Map<String, dynamic> parameters = {};

  GetGCodeThumbnailsCommand(String filename) {
    parameters = {
      'filename': filename,
    };
  }
}
