import 'package:flutter_klipper/src/commands/base.dart';

class ListNotifiersCommand extends BaseCommand {
  @override
  String method = 'server.notifiers.list';

  @override
  Map<String, dynamic> parameters = {};
}
