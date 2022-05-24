import 'package:flutter/material.dart';

enum ColorLib {
  mainPurple,
  secondaryPurple,
}

extension ColorLibExtension on ColorLib {
  static const Map<ColorLib, int> names = {
    ColorLib.mainPurple: 0xFFDE32FA,
    ColorLib.secondaryPurple: 0xFF5830DB
  };

  Color get color => Color(names[this]!);
}
