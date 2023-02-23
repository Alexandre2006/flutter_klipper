import 'package:flutter_klipper/src/commands/command.dart';

class MoonrakerProcessStatsCommand extends BaseCommand {
  @override
  String method = 'moonraker.proc_stats';

  @override
  Map<String, dynamic> parameters = {};
}
