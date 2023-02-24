import 'package:flutter_klipper/src/commands/base.dart';

class TestWebcamCommand extends JsonRPCCommand {
  @override
  String method = 'server.webcams.test';

  @override
  Map<String, dynamic> parameters = {};

  TestWebcamCommand(String name) {
    parameters = {
      'name': name,
    };
  }
}
