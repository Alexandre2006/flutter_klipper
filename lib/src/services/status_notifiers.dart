import 'package:flutter_klipper/src/flutter_klipper_base.dart';
import 'package:state_notifier/state_notifier.dart';

class KlipperStatusNotifier extends StateNotifier<KlipperStatus> {
  KlipperStatusNotifier() : super(KlipperStatus.disconnected);

  /// 
  BasicStatusNotifier ready = BasicStatusNotifier();
  BasicStatusNotifier disconnected = BasicStatusNotifier();
  BasicStatusNotifier error = BasicStatusNotifier();
  BasicStatusNotifier initializing = BasicStatusNotifier();
  BasicStatusNotifier startup = BasicStatusNotifier();
  BasicStatusNotifier shutdown = BasicStatusNotifier();

  set status(KlipperStatus status) {
    if (status != state) {
      if (status == KlipperStatus.ready) {
        ready.status = true;
      } else if (status == KlipperStatus.disconnected) {
        disconnected.status = true;
      } else if (status == KlipperStatus.error) {
        error.status = true;
      } else if (status == KlipperStatus.initializing) {
        initializing.status = true;
      } else if (status == KlipperStatus.shutdown) {
        shutdown.status = true;
      } else if (status == KlipperStatus.startup) {
        startup.status = true;
      }
    }
    state = status;
  }

  KlipperStatus get status => state;
}

class BasicStatusNotifier extends StateNotifier<bool> {
  BasicStatusNotifier() : super(false);

  @override
  bool updateShouldNotify(bool old, bool current) {
    return true;
  }

  set status(bool status) => state = status;
  bool get status => state;
}
