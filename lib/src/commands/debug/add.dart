import 'package:flutter_klipper/src/commands/base.dart';

class AddDebugDatabaseItemCommand extends BaseCommand {
  @override
  String method = 'debug.database.post_item';

  @override
  Map<String, dynamic> parameters = {};

  AddDebugDatabaseItemCommand({
    required String namespace,
    required String key,
    required dynamic value,
  }) {
    parameters['namespace'] = namespace;
    parameters['key'] = key;
    parameters['value'] = value;
  }
}
