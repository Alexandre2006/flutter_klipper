import 'package:flutter_klipper/src/commands/base.dart';

class PublishTopicCommand extends BaseCommand {
  @override
  String method = 'server.mqtt.publish';

  @override
  Map<String, dynamic> parameters = {};

  PublishTopicCommand({
    required String topic,
    dynamic payload,
    int? qos,
    bool retain = false,
    double? timeout,
  }) {
    parameters['topic'] = topic;
    if (payload != null) {
      parameters['payload'] = payload;
    }
    if (qos != null) {
      parameters['qos'] = qos;
    }
    if (timeout != null) {
      parameters['timeout'] = timeout;
    }
    parameters['retain'] = retain;
  }
}
