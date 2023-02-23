import 'package:flutter_klipper/src/commands/base.dart';

class GetUserCommand extends BaseCommand {
  @override
  String method = 'access.get_user';

  @override
  Map<String, dynamic> parameters = {};
}
