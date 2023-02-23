import 'package:flutter_klipper/src/commands/base.dart';

class EditWebcamCommand extends BaseCommand {
  @override
  String method = 'server.webcams.post_item';

  @override
  Map<String, dynamic> parameters = {};

  EditWebcamCommand({
    required String name,
    String? location,
    String? service,
    int? targetFPS,
    String? streamURL,
    String? snapshotURL,
    bool? flipHorizontal,
    bool? flipVertical,
    CameraRotation? rotation,
  }) {
    parameters = {'name': name};
    if (location != null) {
      parameters['location'] = location;
    }
    if (service != null) {
      parameters['service'] = service;
    }
    if (targetFPS != null) {
      parameters['target_fps'] = targetFPS;
    }
    if (streamURL != null) {
      parameters['stream_url'] = streamURL;
    }
    if (snapshotURL != null) {
      parameters['snapshot_url'] = snapshotURL;
    }
    if (flipHorizontal != null) {
      parameters['flip_horizontal'] = flipHorizontal;
    }
    if (flipVertical != null) {
      parameters['flip_vertical'] = flipVertical;
    }
    if (rotation != null) {
      parameters['rotation'] = rotation.index * 90;
    }
  }
}

class AddWebCamCommand extends BaseCommand {
  @override
  String method = 'server.webcams.post_item';

  @override
  Map<String, dynamic> parameters = {};

  AddWebCamCommand({
    required String name,
    String location = "printer",
    String service = "mjpegstreamer",
    int targetFPS = 15,
    required String streamURL,
    required String snapshotURL,
    bool flipHorizontal = false,
    bool flipVertical = false,
    CameraRotation rotation = CameraRotation.none,
  }) {
    parameters = {
      'name': name,
      'location': location,
      'service': service,
      'target_fps': targetFPS,
      'stream_url': streamURL,
      'snapshot_url': snapshotURL,
      'flip_horizontal': flipHorizontal,
      'flip_vertical': flipVertical,
      'rotation': rotation.index * 90,
    };
  }
}

enum CameraRotation {
  none,
  ninety,
  oneEighty,
  twoSeventy,
}
