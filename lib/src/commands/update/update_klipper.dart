import 'package:flutter_klipper/src/commands/base.dart';

class UpdateKlipperCommand extends BaseCommand {
  @override
  String method = 'machine.update.klipper';

  @override
  Map<String, dynamic> parameters = {};
}
