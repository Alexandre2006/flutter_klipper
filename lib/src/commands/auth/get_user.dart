import 'package:flutter_klipper/src/commands/command.dart';

class GetUserCommand extends BaseCommand {
  @override
  String method = 'access.get_user';

  @override
  Map<String, dynamic> parameters = {};
}
