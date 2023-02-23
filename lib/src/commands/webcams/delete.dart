import 'package:flutter_klipper/src/commands/command.dart';

class DeleteWebcamCommand extends BaseCommand {
  @override
  String method = 'server.webcams.delete_item';

  @override
  Map<String, dynamic> parameters = {};

  DeleteWebcamCommand(String name) {
    parameters = {
      'name': name,
    };
  }
}