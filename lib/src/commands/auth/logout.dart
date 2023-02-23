import 'package:flutter_klipper/src/commands/base.dart';

class LogoutUserCommand extends BaseCommand {
  @override
  String method = 'access.logout';

  @override
  Map<String, dynamic> parameters = {};
}
