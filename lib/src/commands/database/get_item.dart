import 'package:flutter_klipper/src/commands/command.dart';

class GetDatabaseItemCommand extends BaseCommand {
  @override
  String method = 'server.database.get_item';

  @override
  Map<String, dynamic> parameters = {};

  GetDatabaseItemCommand(String namespace, String key) {
    parameters = {
      'namespace': namespace,
      'key': key,
    };
  }
}
