import 'package:flutter/foundation.dart';

class Debug {
  static int minimalLevel=-1;

  static void log(int level, s) {
    if (level >= minimalLevel) print('$s');
  }

  static void configuration({minimalLevel}) {
    Debug.minimalLevel = minimalLevel;
  }
}
