import 'package:flutter_klipper/src/commands/base.dart';

class StartServiceCommand extends BaseCommand {
  @override
  String method = 'machine.services.start';

  @override
  Map<String, dynamic> parameters = {};

  StartServiceCommand(StartableService service) {
    parameters = {'service': service.toString()};
  }
}

enum StartableService { webcamd, klipper }
