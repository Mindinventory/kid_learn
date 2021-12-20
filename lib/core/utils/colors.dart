import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

abstract class GradientColors {
  static const primary = [
    Color(0xFF822FA3),
    Color(0xFFEF5984),
    Color(0xFFFF3F5C)
  ];

  static const darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [AppColors.primary, Colors.transparent],
  );
}

abstract class AppColors {
  static const primary = Color(0xFFffa21c);
  static const hippoColor = Color(0xFF895f6f);
  static const rabbitColor = Color(0xFF9bc6ba);
  static const giraffeColor = Color(0xFFffe083);
  static const tigerColor = Color(0xFFd64e00);
  static const bearColor = Color(0xFFffe0b5);
  static const scaffoldBackgroundColor = Colors.white;
  static const black = Color(0xFF333333);
  static const white = Colors.white;
}
