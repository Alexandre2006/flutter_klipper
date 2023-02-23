import 'package:flutter_klipper/src/commands/command.dart';

class CreateUserCommand extends BaseCommand {
  @override
  String method = 'access.post_user';

  @override
  Map<String, dynamic> parameters = {};

  CreateUserCommand(String username, String password) {
    parameters = {
      'username': username,
      'password': password,
    };
  }
}
