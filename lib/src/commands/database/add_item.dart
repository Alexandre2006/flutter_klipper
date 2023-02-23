import 'package:flutter_klipper/src/commands/base.dart';

class AddDatabaseItemCommand extends BaseCommand {
  @override
  String method = 'server.database.post_item';

  @override
  Map<String, dynamic> parameters = {};

  AddDatabaseItemCommand(String namespace, String key, dynamic value) {
    parameters = {
      'namespace': namespace,
      'key': key,
      'value': value,
    };
  }
}
