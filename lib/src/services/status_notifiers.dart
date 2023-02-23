import 'package:flutter_klipper/src/flutter_klipper_base.dart';
import 'package:state_notifier/state_notifier.dart';

class KlipperStatusNotifier extends StateNotifier<KlipperStatus> {
  KlipperStatusNotifier() : super(KlipperStatus.disconnected);

  set status(KlipperStatus status) => state = status;
  KlipperStatus get status => state;
}
