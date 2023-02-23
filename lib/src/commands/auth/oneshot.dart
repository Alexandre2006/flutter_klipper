import 'package:flutter_klipper/src/commands/command.dart';

class GenerateOneshotTokenCommand extends BaseCommand {
  @override
  String method = 'access.oneshot_token';

  @override
  Map<String, dynamic> parameters = {};
}
