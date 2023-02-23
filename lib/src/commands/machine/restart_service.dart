import 'package:flutter_klipper/src/commands/command.dart';

class RestartServiceCommand extends BaseCommand {
  @override
  String method = 'machine.services.restart';

  @override
  Map<String, dynamic> parameters = {};

  final Map<RestartableService, String> _services = {
    RestartableService.crowsnest: 'crowsnest',
    RestartableService.mooncord: 'MoonCord',
    RestartableService.moonraker: 'moonraker',
    RestartableService.moonrakerTelegramBot: 'moonraker-telegram-bot',
    RestartableService.klipper: 'klipper',
    RestartableService.klipperScreen: 'KlipperScreen',
    RestartableService.sonar: 'sonar',
    RestartableService.webcamd: 'webcamd'
  };

  RestartServiceCommand(RestartableService service) {
    parameters = {'service': _services[service]};
  }
}

enum RestartableService {
  crowsnest,
  mooncord,
  moonraker,
  moonrakerTelegramBot,
  klipper,
  klipperScreen,
  sonar,
  webcamd
}
