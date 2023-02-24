import 'dart:convert';
import 'dart:io';

import 'package:flutter_klipper/src/errors/klipper_com_error.dart';

abstract class JsonRPCCommand {
  abstract String method;
  abstract Map<String, dynamic> parameters;

  dynamic parseResponse(dynamic response) {
    if (response.toString().contains("JSON-RPC error")) {
      final Map error = json.decode(
        response
            .toString()
            .substring(response.toString().indexOf(':') + 2)
            .replaceAll('"', '\\"')
            .replaceAll("'", '"'),
      ) as Map;
      throw KlipperCommandError(
        error['error'].toString(),
        error['message'].toString(),
      );
    } else {
      return response.toString();
    }
  }
}
