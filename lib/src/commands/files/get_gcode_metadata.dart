import 'package:flutter_klipper/src/commands/base.dart';

class GetGCodeMetadataCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.metadata';

  @override
  Map<String, dynamic> parameters = {};

  GetGCodeMetadataCommand(String filename) {
    parameters = {
      'filename': filename,
    };
  }
}
