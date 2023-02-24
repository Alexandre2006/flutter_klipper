import 'package:flutter_klipper/src/commands/base.dart';

class UpdateClientCommand extends JsonRPCCommand {
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
