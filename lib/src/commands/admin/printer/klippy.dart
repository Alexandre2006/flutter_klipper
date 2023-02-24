import 'package:flutter_klipper/src/commands/base.dart';

class KlippyHostInfoCommand extends JsonRPCCommand {
  @override
  String method = 'printer.info';

  @override
  Map<String, dynamic> parameters = {};
}
