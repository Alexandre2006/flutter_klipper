import 'package:flutter_klipper/src/commands/base.dart';

class GetDatabaseItemCommand extends JsonRPCCommand {
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
