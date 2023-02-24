import 'package:flutter_klipper/src/commands/base.dart';

class ListDebugDatabaseNamespacesCommand extends JsonRPCCommand {
  @override
  String method = 'debug.database.list';

  @override
  Map<String, dynamic> parameters = {};
}
