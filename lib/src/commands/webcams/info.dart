import 'package:flutter_klipper/src/commands/command.dart';

class WebcamInfoCommand extends BaseCommand {
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
