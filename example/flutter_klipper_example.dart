import 'dart:io';

import 'package:flutter_klipper/flutter_klipper.dart';

void main() {
  Klipper('raspberrypi.local').statusNotifier.addListener((state) {
    print(state);
  });
  stdin.listen((event) {});
}
