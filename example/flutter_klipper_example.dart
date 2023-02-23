import 'dart:io';

import 'package:flutter_klipper/flutter_klipper.dart';

void main() {
  Klipper('raspberrypi.local').statusNotifier
    ..disconnected.addListener((state) {
      print('disconnected');
    })
    ..error.addListener((state) {
      print('error');
    })
    ..initializing.addListener((state) {
      print('initializing');
    })
    ..ready.addListener((state) {
      print('ready');
    })
    ..shutdown.addListener((state) {
      print('shutdown');
    })
    ..startup.addListener((state) {
      print('startup');
    });
  stdin.listen((event) {});
}
