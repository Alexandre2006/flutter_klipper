import 'package:flutter_klipper/src/commands/base.dart';

class QueryEndstopsCommand extends JsonRPCCommand {
  @override
  String method = 'printer.query_endstops.status';

  @override
  Map<String, dynamic> parameters = {};
}
