import 'package:flutter_klipper/src/commands/base.dart';

class WebcamInfoCommand extends JsonRPCCommand {
  @override
  String method = 'erver.webcams.get_item';

  @override
  Map<String, dynamic> parameters = {};

  WebcamInfoCommand(String webcamName) {
    parameters = {
      'name': webcamName,
    };
  }
}
