import 'package:flutter_klipper/src/commands/command.dart';

class UpdateClientCommand extends BaseCommand {
  @override
  String method = 'machine.update.client';

  @override
  Map<String, dynamic> parameters = {};

  UpdateClientCommand(String name) {
    parameters = {
      'name': name,
    };
  }
}
