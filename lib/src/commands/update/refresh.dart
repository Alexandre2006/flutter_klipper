import 'package:flutter_klipper/src/commands/base.dart';

class RefreshUpdateStatusCommand extends BaseCommand {
  @override
  String method = 'machine.update.refresh';

  @override
  Map<String, dynamic> parameters = {};

  RefreshUpdateStatusCommand({String? application}) {
    if (application != null) {
      parameters = {
        'application': application,
      };
    }
  }
}
