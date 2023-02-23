import 'package:flutter_klipper/src/commands/command.dart';

class ListExtensionsCommand extends BaseCommand {
  @override
  String method = 'server.extensions.list';

  @override
  Map<String, dynamic> parameters = {};
}
