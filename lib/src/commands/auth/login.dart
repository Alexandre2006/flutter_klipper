import 'package:flutter_klipper/src/commands/command.dart';

class LoginUserCommand extends BaseCommand {
  @override
  String method = 'access.login';

  @override
  Map<String, dynamic> parameters = {};

  LoginUserCommand(
    String username,
    String password, {
    AuthSource source = AuthSource.moonraker,
  }) {
    parameters = {
      'username': username,
      'password': password,
      'source': source.toString()
    };
  }
}

enum AuthSource { ldap, moonraker }
