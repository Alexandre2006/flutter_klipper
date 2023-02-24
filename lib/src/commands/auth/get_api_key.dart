import 'package:flutter_klipper/src/commands/base.dart';

class GetApiKeyCommand extends JsonRPCCommand {
  @override
  String method = 'access.get_api_key';

  @override
  Map<String, dynamic> parameters = {};
}
