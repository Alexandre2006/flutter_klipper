import 'package:flutter_klipper/src/commands/base.dart';

class SubscribeTopicCommand extends JsonRPCCommand {
  @override
  String method = 'server.mqtt.subscribe';

  @override
  Map<String, dynamic> parameters = {};

  SubscribeTopicCommand(String topic, int? qos, double? timeout) {
    parameters['topic'] = topic;
    if (qos != null) {
      parameters['qos'] = qos;
    }
    if (timeout != null) {
      parameters['timeout'] = timeout;
    }
  }
}
