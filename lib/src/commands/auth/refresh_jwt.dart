import 'package:flutter_klipper/src/commands/command.dart';

class RefreshJSONWebTokenCommand extends BaseCommand {
  @override
  String method = 'access.refresh_jwt';

  @override
  Map<String, dynamic> parameters = {};

  RefreshJSONWebTokenCommand(String refreshToken) {
    parameters = {
      'refresh_token': refreshToken,
    };
  }
}
