import 'dart:io';

import 'package:flutter_klipper/flutter_klipper.dart';

void main() async {
  // Example Coming Soon!
  Klipper klipper = Klipper('raspberrypi.local', port: 7125);

  klipper.statusNotifier.ready.addListener(
      (ready) => {print("Connected and ready to receive commands!")});
  klipper.sendCommand(RunGCodeCommand('G28'));
}
