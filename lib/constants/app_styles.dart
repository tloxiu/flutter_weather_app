import 'package:flutter/material.dart';

/// class containing all styles and constants used in the app
class AppStyles {
  AppStyles._();

  // application colors
  static const Color primaryColor = Colors.blue;
  static const Color textColor = Colors.black87;
  static const Color backgroundColor = Colors.white;

  // icon sizes
  static const double appBarIconSize = 20.0;
  static const double weatherIconSize = 30.0;

  // margins and paddings
  static const EdgeInsets screenPadding = EdgeInsets.all(40.0);
  static const EdgeInsets contentPadding = EdgeInsets.all(20.0);

  // containers sizes
  static const double weatherInfoWidth = 120.0;
  static const double weatherInfoHeight = 100.0;

  // text styles
  static const TextStyle temperatureStyle = TextStyle(
    fontSize: 95.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    height: 1,
  );

  static const TextStyle descriptionStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.grey,
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );

  static const TextStyle valueStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  // animation durations
  static const Duration fadeAnimationDuration = Duration(milliseconds: 800);
}
