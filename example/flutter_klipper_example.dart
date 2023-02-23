import 'dart:io';

import 'package:flutter_klipper/flutter_klipper.dart';

void main() {
  Klipper klipper = Klipper('raspberrypi.local', port: 7125);
  stdin.listen((event) {});
}
