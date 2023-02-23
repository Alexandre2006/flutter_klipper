abstract class ObjectStatusQuery {
  String name = '';
  Map<String, bool> parameters = {};
}

class WebhookStatusQuery extends ObjectStatusQuery {
  WebhookStatusQuery({bool state = true, bool stateMessage = true}) {
    name = 'webhooks';
    parameters['state'] = state;
    parameters['state_message'] = stateMessage;
  }
}

class GCodeMoveStatusQuery extends ObjectStatusQuery {
  GCodeMoveStatusQuery({
    bool speedFactor = true,
    bool speed = true,
    bool extrudeFactor = true,
    bool absoluteCoordinates = true,
    bool absoluteExtrude = true,
    bool homingOrigin = true,
    bool position = true,
    bool gcodePosition = true,
  }) {
    name = 'gcode_move';
    parameters['speed_factor'] = speedFactor;
    parameters['speed'] = speed;
    parameters['extrude_factor'] = extrudeFactor;
    parameters['absolute_coordinates'] = absoluteCoordinates;
    parameters['absolute_extrude'] = absoluteExtrude;
    parameters['homing_origin'] = homingOrigin;
    parameters['position'] = position;
    parameters['gcode_position'] = gcodePosition;
  }
}

class ToolheadStatusQuery extends ObjectStatusQuery {
  ToolheadStatusQuery({
    bool homedAxes = true,
    bool printTime = true,
    bool estimatedPrintTime = true,
    bool extruder = true,
    bool position = true,
    bool maxVelocity = true,
    bool maxAcceleration = true,
    bool maxAccelerationToDeceleration = true,
    bool squareCornerVelocity = true,
  }) {
    name = 'toolhead';
    parameters['homed_axes'] = homedAxes;
    parameters['print_time'] = printTime;
    parameters['estimated_print_time'] = estimatedPrintTime;
    parameters['extruder'] = extruder;
    parameters['position'] = position;
    parameters['max_velocity'] = maxVelocity;
    parameters['max_accel'] = maxAcceleration;
    parameters['max_accel_to_decel'] = maxAccelerationToDeceleration;
    parameters['square_corner_velocity'] = squareCornerVelocity;
  }
}

class ConfigFileStatusQuery extends ObjectStatusQuery {
  ConfigFileStatusQuery({
    bool config = true,
    bool settings = true,
    bool saveConfigPending = true,
  }) {
    name = 'configfile';
    parameters['config'] = config;
    parameters['settings'] = settings;
    parameters['save_config_pending'] = saveConfigPending;
  }
}

class ExtruderStatusQuery extends ObjectStatusQuery {
  ExtruderStatusQuery({
    bool temperature = true,
    bool target = true,
    bool power = true,
    bool pressureAdvance = true,
    bool smoothTime = true,
  }) {
    name = 'extruder';
    parameters['temperature'] = temperature;
    parameters['target'] = target;
    parameters['power'] = power;
    parameters['pressure_advance'] = pressureAdvance;
    parameters['smooth_time'] = smoothTime;
  }
}

class HeaterBedStatusQuery extends ObjectStatusQuery {
  HeaterBedStatusQuery({
    bool temperature = true,
    bool target = true,
    bool power = true,
  }) {
    name = 'heater_bed';
    parameters['temperature'] = temperature;
    parameters['target'] = target;
    parameters['power'] = power;
  }
}

class FanStatusQuery extends ObjectStatusQuery {
  FanStatusQuery({
    bool speed = true,
    bool rpm = true,
  }) {
    name = 'fan';
    parameters['speed'] = speed;
    parameters['rpm'] = rpm;
  }
}

class IdleTimeoutStatusQuery extends ObjectStatusQuery {
  IdleTimeoutStatusQuery({
    bool state = true,
    bool printingTime = true,
  }) {
    name = 'idle_timeout';
    parameters['state'] = state;
    parameters['printing_time'] = printingTime;
  }
}

class VirtualSDCardStatusQuery extends ObjectStatusQuery {
  VirtualSDCardStatusQuery({
    bool progress = true,
    bool isActive = true,
    bool filePosition = true,
  }) {
    name = 'virtual_sdcard';
    parameters['progress'] = progress;
    parameters['is_active'] = isActive;
    parameters['file_position'] = filePosition;
  }
}

class PrintStatsStatusQuery extends ObjectStatusQuery {
  PrintStatsStatusQuery({
    bool filename = true,
    bool totalDuration = true,
    bool printDuration = true,
    bool filamentUsed = true,
    bool state = true,
    bool message = true,
  }) {
    name = 'print_stats';
    parameters['filename'] = filename;
    parameters['total_duration'] = totalDuration;
    parameters['print_duration'] = printDuration;
    parameters['filament_used'] = filamentUsed;
    parameters['state'] = state;
    parameters['message'] = message;
  }
}

class DisplayStatusStatusQuery extends ObjectStatusQuery {
  DisplayStatusStatusQuery({
    bool message = true,
    bool progress = true,
  }) {
    name = 'display_status';
    parameters['message'] = message;
    parameters['progress'] = progress;
  }
}

class TemperatureSensorStatusQuery extends ObjectStatusQuery {
  TemperatureSensorStatusQuery(
    String name, {
    bool temperature = true,
    bool measuredMinTemp = true,
    bool measuredMaxTemp = true,
  }) {
    name = 'temperature_sensor $name';
    parameters['temperature'] = temperature;
    parameters['measured_min_temp'] = measuredMinTemp;
    parameters['measured_max_temp'] = measuredMaxTemp;
  }
}

class TemperatureFanStatusQuery extends ObjectStatusQuery {
  TemperatureFanStatusQuery(
    String name, {
    bool speed = true,
    bool temperature = true,
    bool target = true,
  }) {
    name = 'temperature_fan $name';
    parameters['speed'] = speed;
    parameters['temperature'] = temperature;
    parameters['target'] = target;
  }
}

class FilamentSwitchSensorStatusQuery extends ObjectStatusQuery {
  FilamentSwitchSensorStatusQuery(
    String name, {
    bool filamentDetected = true,
    bool enabled = true,
  }) {
    name = 'filament_switch_sensor $name';
    parameters['filament_detected'] = filamentDetected;
    parameters['enabled'] = enabled;
  }
}

class OutputPinStatusQuery extends ObjectStatusQuery {
  OutputPinStatusQuery(
    String name, {
    bool value = true,
  }) {
    name = 'output_pin $name';
    parameters['value'] = value;
  }
}

class BedMeshStatusQuery extends ObjectStatusQuery {
  BedMeshStatusQuery({
    bool profileName = true,
    bool meshMin = true,
    bool meshMax = true,
    bool probedMatrix = true,
    bool meshMatrix = true,
  }) {
    name = 'bed_mesh';
    parameters['profile_name'] = profileName;
    parameters['mesh_min'] = meshMin;
    parameters['mesh_max'] = meshMax;
    parameters['probed_matrix'] = probedMatrix;
    parameters['mesh_matrix'] = meshMatrix;
  }
}

class GCodeMacroStatusQuery extends ObjectStatusQuery {
  GCodeMacroStatusQuery(String name) {
    name = 'gcode_macro $name';
  }
}

class CustomStatusQuery extends ObjectStatusQuery {
  CustomStatusQuery(String name, List<String> parameters) {
    this.name = name;
    for (final parameter in parameters) {
      this.parameters[parameter] = true;
    }
  }
}
