import 'package:flutter_klipper/src/commands/base.dart';

class DeleteDebugDatabaseItemCommand extends BaseCommand {
  @override
  String method = 'debug.database.delete_item';

  @override
  Map<String, dynamic> parameters = {};

  DeleteDebugDatabaseItemCommand({
    required String namespace,
    required String key,
  }) {
    parameters['namespace'] = namespace;
    parameters['key'] = key;
  }
}
