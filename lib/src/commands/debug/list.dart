import 'package:flutter_klipper/src/commands/command.dart';

class ListDebugDatabaseNamespacesCommand extends BaseCommand {
  @override
  String method = 'debug.database.list';

  @override
  Map<String, dynamic> parameters = {};
}
