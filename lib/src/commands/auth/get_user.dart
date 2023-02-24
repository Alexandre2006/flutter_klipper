import 'package:flutter_klipper/src/commands/base.dart';

class GetUserCommand extends JsonRPCCommand {
  @override
  String method = 'access.get_user';

  @override
  Map<String, dynamic> parameters = {};
}
