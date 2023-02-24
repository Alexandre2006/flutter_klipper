import 'package:flutter_klipper/src/commands/base.dart';

class ScanGCodeMetadataCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.metascan';

  @override
  Map<String, dynamic> parameters = {};

  ScanGCodeMetadataCommand(String filename) {
    parameters = {
      'filename': filename,
    };
  }
}
