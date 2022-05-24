import 'package:flutter/material.dart';

enum ColorLib { tjBlue, tjLightGreen, tjDarkGreen, tjYellow, tjRed }

extension ColorLibExtension on ColorLib {
  static const Map<ColorLib, int> names = {
    ColorLib.tjBlue: 0xFF049DD9,
    ColorLib.tjLightGreen: 0xFF038C33,
    ColorLib.tjDarkGreen: 0xFF02732A,
    ColorLib.tjYellow: 0xFFF2E205,
    ColorLib.tjRed: 0xFFD91E1E
  };

  Color get color => Color(names[this]!);
}
