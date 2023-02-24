import 'package:flutter_klipper/src/commands/base.dart';

class DeleteUserCommand extends JsonRPCCommand {
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
