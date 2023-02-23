import 'package:flutter_klipper/src/commands/command.dart';

class GetStripsCommand extends BaseCommand {
  @override
  String method = 'machine.wled.strips';

  @override
  Map<String, dynamic> parameters = {};
}
