import 'package:flutter_klipper/src/commands/base.dart';

class IdentifyConnectionCommand extends BaseCommand {
  @override
  String method = 'server.connection.identify';

  @override
  Map<String, dynamic> parameters = {};

  IdentifyConnectionCommand(
      {required String clientName,
      required String version,
      required ConnectionType type,
      required String url,
      String? accessToken,
      String? apiKey,}) {
    parameters['client_name'] = clientName;
    parameters['version'] = version;
    parameters['type'] = type.toString();
    parameters['url'] = url;
    if (accessToken != null) {
      parameters['access_token'] = accessToken;
    }
    if (apiKey != null) {
      parameters['api_key'] = apiKey;
    }
  }
}

enum ConnectionType { web, mobile, desktop, display, bot, agent, other }
