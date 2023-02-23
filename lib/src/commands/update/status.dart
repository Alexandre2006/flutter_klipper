import 'package:flutter_klipper/src/commands/base.dart';

class GetUpdateStatusCommand extends BaseCommand {
  @override
  String method = 'machine.update.status';

  @override
  Map<String, dynamic> parameters = {};

  GetUpdateStatusCommand({bool refresh = false}) {
    parameters = {
      'refresh': refresh,
    };
  }
}
