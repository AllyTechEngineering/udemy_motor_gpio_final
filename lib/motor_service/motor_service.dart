// TODO: Import Packages
import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class MotorService {
  // TODO: Define a static variable for GPIO pin 16
  // ignore: prefer_typing_uninitialized_variables
  static var gpio16;

  // TODO: Initialize GPIO 16 as an output
  void initGpio16Output() {
    try {
      gpio16 = GPIO(16, GPIOdirection.gpioDirOut);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  // TODO: Set the output level of GPIO 16
  void gpio16OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio16.write(outputValue);
  }

  // TODO: Dispose of the GPIO resources
      void disposeGpio() {
    gpio16.dispose();
  }
  
}
