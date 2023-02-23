import 'package:flutter_klipper/src/commands/command.dart';

class GetDebugDatabaseItemCommand extends BaseCommand {
  @override
  String method = 'debug.database.get_item';

  @override
  Map<String, dynamic> parameters = {};

  GetDebugDatabaseItemCommand({
    required String namespace,
    required String key,
  }) {
    parameters['namespace'] = namespace;
    parameters['key'] = key;
  }
}
