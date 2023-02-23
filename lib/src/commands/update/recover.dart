import 'package:flutter_klipper/src/commands/command.dart';

class RecoverCorruptRepositoryCommand extends BaseCommand {
  @override
  String method = 'machine.update.system';

  @override
  Map<String, dynamic> parameters = {};

  RecoverCorruptRepositoryCommand(String name, {bool hard = false}) {
    parameters = {
      'name': name,
      'hard': hard,
    };
  }
}
