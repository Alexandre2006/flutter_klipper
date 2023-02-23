import 'package:flutter_klipper/src/commands/base.dart';

class DeleteDatabaseItemCommand extends BaseCommand {
  @override
  String method = 'server.database.delete_item';

  @override
  Map<String, dynamic> parameters = {};

  DeleteDatabaseItemCommand(String namespace, String key) {
    parameters = {
      'namespace': namespace,
      'key': key,
    };
  }
}
