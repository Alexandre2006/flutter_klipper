import 'package:flutter_klipper/src/commands/command.dart';

class PrintFileCommand extends BaseCommand {
  @override
  String method = 'printer.print.start';

  @override
  Map<String, dynamic> parameters = {};

  PrintFileCommand(String filename) {
    parameters['filename'] = filename;
  }
}