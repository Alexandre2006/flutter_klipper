import 'package:flutter_klipper/src/commands/base.dart';

class RefreshJSONWebTokenCommand extends JsonRPCCommand {
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
