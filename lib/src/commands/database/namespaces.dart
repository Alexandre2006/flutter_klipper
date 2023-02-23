import 'package:flutter_klipper/src/commands/command.dart';

class GetNamespacesCommand extends BaseCommand {
  @override
  String method = 'server.database.list';

  @override
  Map<String, dynamic> parameters = {};
}
