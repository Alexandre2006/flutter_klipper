import 'package:flutter_klipper/src/commands/base.dart';

class ResetUserPasswordCommand extends BaseCommand {
  @override
  String method = 'access.user.password';

  @override
  Map<String, dynamic> parameters = {};

  ResetUserPasswordCommand(String oldPassword, String newPassword) {
    parameters = {
      'password': oldPassword,
      'new_password': newPassword,
    };
  }
}
