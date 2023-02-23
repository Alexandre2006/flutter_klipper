import 'package:flutter_klipper/src/commands/command.dart';

class CallExtensionsMethodCommand extends BaseCommand {
  @override
  String method = 'server.extensions.request';

  @override
  Map<String, dynamic> parameters = {};

  CallExtensionsMethodCommand(
    String agent,
    String method, {
    Map<String, dynamic>? arguments,
  }) {
    parameters = {
      'agent': agent,
      'method': method,
    };
    if (arguments != null) {
      parameters['arguments'] = arguments;
    }
  }
}
