import 'package:flutter_klipper/src/commands/command.dart';

class GetApiKeyCommand extends BaseCommand {
  @override
  String method = 'access.get_api_key';

  @override
  Map<String, dynamic> parameters = {};
}
