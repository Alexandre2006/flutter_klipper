import 'package:flutter_klipper/src/commands/base.dart';

class StopServiceCommand extends BaseCommand {
  @override
  String method = 'machine.services.stop';

  @override
  Map<String, dynamic> parameters = {};

  StopServiceCommand(StoppableService service) {
    parameters = {'service': service.toString()};
  }
}

enum StoppableService { webcamd, klipper }
