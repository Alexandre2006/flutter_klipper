import 'package:flutter_klipper/src/commands/command.dart';

class TestWebcamCommand extends BaseCommand {
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