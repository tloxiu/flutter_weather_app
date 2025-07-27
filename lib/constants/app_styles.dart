import 'package:flutter/material.dart';

/// Klasa zawierająca wszystkie style i stałe używane w aplikacji
class AppStyles {
  // Prywatny konstruktor - klasa tylko ze stałymi
  AppStyles._();

  // Kolory aplikacji
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.orange;
  static const Color textColor = Colors.black87;
  static const Color hintColor = Colors.grey;
  static const Color backgroundColor = Colors.white;

  // Rozmiary ikon
  static const double logoIconSize = 80.0;
  static const double appBarIconSize = 20.0;
  static const double weatherIconSize = 30.0;

  // Marginesy i padding
  static const EdgeInsets screenPadding = EdgeInsets.all(40.0);
  static const EdgeInsets contentPadding = EdgeInsets.all(20.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 15,
  );

  // Radiusy zaokrągleń
  static const double cardBorderRadius = 30.0;
  static const double buttonBorderRadius = 25.0;
  static const double inputBorderRadius = 8.0;

  // Rozmiary kontenerów
  static const double weatherInfoWidth = 120.0;
  static const double weatherInfoHeight = 100.0;

  // Style tekstów
  static const TextStyle titleStyle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle temperatureStyle = TextStyle(
    fontSize: 95.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    height: 1,
  );

  static const TextStyle descriptionStyle = TextStyle(
    fontSize: 18.0,
    color: hintColor,
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 12.0,
    color: hintColor,
  );

  static const TextStyle valueStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle inputStyle = TextStyle(
    fontSize: 18.0,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontSize: 16.0,
  );

  // Cienie
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color.fromRGBO(158, 158, 158, 0.2),
      spreadRadius: 5,
      blurRadius: 20,
      offset: Offset(0, 1),
    ),
  ];

  // Czas trwania animacji
  static const Duration fadeAnimationDuration = Duration(milliseconds: 800);
  static const Duration containerAnimationDuration = Duration(milliseconds: 300);
  static const Duration switcherAnimationDuration = Duration(milliseconds: 400);
}
