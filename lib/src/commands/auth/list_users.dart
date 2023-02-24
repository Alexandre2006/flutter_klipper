import 'package:flutter_klipper/src/commands/base.dart';

class ListUsersCommand extends JsonRPCCommand {
  @override
  String method = 'access.users.list';

  @override
  Map<String, dynamic> parameters = {};
}
