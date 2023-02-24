import 'package:flutter_klipper/src/commands/base.dart';

class ListRootsCommands extends JsonRPCCommand {
  @override
  String method = 'server.files.roots';

  @override
  Map<String, dynamic> parameters = {};
}
