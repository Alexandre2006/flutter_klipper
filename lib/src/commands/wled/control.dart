import 'package:flutter_klipper/src/commands/command.dart';

class ControlStripCommand extends BaseCommand {
  @override
  String method = 'machine.wled.post_strip';

  @override
  Map<String, dynamic> parameters = {};

  ControlStripCommand(
    String strip, {
    required ControlAction action,
    int? preset,
    int? brightness,
    int? intensity,
    int? speed,
  }) {
    parameters = {
      'strip': strip,
      'action': action.toString(),
      if (preset != null) 'preset': preset,
      if (brightness != null) 'brightness': brightness,
      if (intensity != null) 'intensity': intensity,
      if (speed != null) 'speed': speed,
    };
  }
}

enum ControlAction { on, off, toggle, control }
