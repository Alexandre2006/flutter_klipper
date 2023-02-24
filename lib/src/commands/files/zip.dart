import 'package:flutter_klipper/src/commands/base.dart';

class ZipFilesCommand extends JsonRPCCommand {
  @override
  String method = 'server.files.zip';

  @override
  Map<String, dynamic> parameters = {};

  ZipFilesCommand(
    List<String> filenames, {
    String? destination,
    bool storeOnly = false,
  }) {
    if (destination != null) {
      parameters = {
        'destination': destination,
      };
    }
    parameters = {
      'filenames': filenames,
      'store_only': storeOnly,
    };
  }
}
