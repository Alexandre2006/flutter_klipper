import 'package:flutter_klipper/src/commands/base.dart';

class ListExtensionsCommand extends JsonRPCCommand {
  @override
  String method = 'server.extensions.list';

  @override
  Map<String, dynamic> parameters = {};
}
