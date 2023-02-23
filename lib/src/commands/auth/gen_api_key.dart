import 'package:flutter_klipper/src/commands/command.dart';

class GenerateApiKeyCommand extends BaseCommand {
  @override
  String method = 'access.post_api_key';

  @override
  Map<String, dynamic> parameters = {};
}
