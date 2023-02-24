import 'package:flutter_klipper/src/commands/base.dart';
import 'package:flutter_klipper/src/commands/status/status_objects.dart';

class PrinterObjectsSubscribeCommand extends JsonRPCCommand {
  @override
  String method = 'printer.objects.subscribe';

  @override
  Map<String, dynamic> parameters = {};

  PrinterObjectsSubscribeCommand({required List<ObjectStatusQuery> objects}) {
    for (final element in objects) {
      final tempParameters = parameters as Map<String, Map<String, dynamic>>;
      tempParameters['objects'] = {};
      tempParameters['objects']![element.name] =
          element.parameters.isEmpty ? null : element.parameters;
      parameters = tempParameters;
    }
  }
}

class PrinterObjectsUnSubscribeCommand extends JsonRPCCommand {
  @override
  String method = 'printer.objects.subscribe';

  @override
  Map<String, dynamic> parameters = {"objects": null};
}
