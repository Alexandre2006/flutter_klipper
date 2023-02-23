import 'package:flutter_klipper/src/commands/command.dart';

class SetSudoPasswordCommand extends BaseCommand {
  @override
  String method = 'machine.sudo.password';

  @override
  Map<String, dynamic> parameters = {};

  SetSudoPasswordCommand(String password) {
    parameters = {
      'password': password,
    };
  }
}
