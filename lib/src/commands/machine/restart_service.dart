import 'package:flutter_klipper/src/commands/base.dart';

class RestartServiceCommand extends JsonRPCCommand {
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

/// Services that can be restarted by the [RestartServiceCommand]
enum RestartableService {
  /// Restart the crowsnest service
  crowsnest,

  /// Restart the MoonCord service
  mooncord,

  /// Restart the moonraker service
  moonraker,

  /// Restart the moonraker-telegram-bot service
  moonrakerTelegramBot,

  /// Restart the klipper service
  klipper,

  /// Restart the KlipperScreen service
  klipperScreen,

  /// Restart the sonar service
  sonar,

  /// Restart the webcamd service
  webcamd
}
