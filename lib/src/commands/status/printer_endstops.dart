import 'package:flutter_klipper/src/commands/command.dart';

class QueryEndstopsCommand extends BaseCommand {
  @override
  String method = 'printer.query_endstops.status';

  @override
  Map<String, dynamic> parameters = {};
}
