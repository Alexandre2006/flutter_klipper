import 'package:flutter_klipper/flutter_klipper.dart';

void main() {
  // Example Coming Soon!
  Klipper('raspberrypi.local').statusNotifier
    ..disconnected.addListener((state) {
      print("Client Disconnected");
    }, fireImmediately: false,)
    ..ready.addListener((state) {
      print("Client Ready");
    }, fireImmediately: false,)
    ..error.addListener((state) {
      print("Client Error");
    }, fireImmediately: false,)
    ..initializing.addListener((state) {
      print("Client Initializing");
    }, fireImmediately: false,)
    ..shutdown.addListener((state) {
      print("Client Shutdown");
    }, fireImmediately: false,)
    ..startup.addListener((state) {
      print("Client Starting");
    }, fireImmediately: false,);
}
