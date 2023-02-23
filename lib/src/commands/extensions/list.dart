import 'package:flutter_klipper/src/commands/base.dart';

class ListExtensionsCommand extends BaseCommand {
  @override
  String method = 'server.extensions.list';

  @override
  Map<String, dynamic> parameters = {};
}
