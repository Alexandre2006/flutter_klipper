import 'package:flutter_klipper/src/commands/base.dart';

class GetAuthorizationEndpointInfoCommand extends BaseCommand {
  @override
  String method = 'access.info';

  @override
  Map<String, dynamic> parameters = {};
}
