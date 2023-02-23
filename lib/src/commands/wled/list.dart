import 'package:flutter_klipper/src/commands/base.dart';

class GetStripsCommand extends BaseCommand {
  @override
  String method = 'machine.wled.strips';

  @override
  Map<String, dynamic> parameters = {};
}
