import 'package:flutter_klipper/src/commands/base.dart';

class DeleteUserCommand extends BaseCommand {
  @override
  String method = 'access.delete_user';

  @override
  Map<String, dynamic> parameters = {};

  DeleteUserCommand(String username) {
    parameters = {
      'username': username,
    };
  }
}
