import 'package:flutter_klipper/src/commands/base.dart';

class GetHistoryListCommand extends BaseCommand {
  @override
  String method = 'server.history.list';

  @override
  Map<String, dynamic> parameters = {};

  GetHistoryListCommand({
    int? start,
    int? limit,
    DateTime? before,
    DateTime? since,
    HistoryOrder order = HistoryOrder.desc,
  }) {
    if (start != null) {
      parameters['start'] = start;
    }
    if (limit != null) {
      parameters['limit'] = limit;
    }
    if (before != null) {
      parameters['before'] = before.millisecondsSinceEpoch;
    }
    if (since != null) {
      parameters['since'] = since.millisecondsSinceEpoch;
    }
    parameters['order'] = order.toString();
  }
}

enum HistoryOrder {
  asc,
  desc,
}
