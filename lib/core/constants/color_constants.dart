import 'package:flutter/material.dart';

class ColorConstants {
  // Light Theme Colors
  static const Color orange = Color(0xFFFCAB4C);
  static const Color red = Colors.redAccent;
  static const Color lightBlue = Color(0xFF6B8EFE);
  static const Color offWhite = Color(0xFFF6F6F4);
  static const Color darkGray = Color(0xFF171615);
  static const Color white = Color(0xFFFFFFFF);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFE0E0E0);
  static const Color darkSecondaryText = Color(0xFFBDBDBD);
  static const Color darkBlue = Color(0xFF5A7BE0);
}

// Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorConstants.offWhite,
  colorScheme: ColorScheme.light(
    primary: ColorConstants.orange,
    secondary: ColorConstants.red,
    surface: ColorConstants.white,
    background: ColorConstants.offWhite,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: ColorConstants.darkGray, fontSize: 16),
    bodyMedium: TextStyle(color: ColorConstants.darkGray, fontSize: 14),
    titleLarge: TextStyle(color: ColorConstants.darkGray, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.orange,
    titleTextStyle: TextStyle(
      color: ColorConstants.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardTheme(
    color: ColorConstants.white,
    elevation: 2,
    margin: const EdgeInsets.all(8),
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorConstants.darkBackground,
  colorScheme: ColorScheme.dark(
    primary: ColorConstants.orange,
    secondary: ColorConstants.darkBlue,
    surface: ColorConstants.darkSurface,
    background: ColorConstants.darkBackground,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: ColorConstants.darkText, fontSize: 16),
    bodyMedium: TextStyle(color: ColorConstants.darkSecondaryText, fontSize: 14),
    titleLarge: TextStyle(color: ColorConstants.darkText, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.darkSurface,
    titleTextStyle: TextStyle(
      color: ColorConstants.darkText,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardTheme(
    color: ColorConstants.darkSurface,
    elevation: 2,
    margin: const EdgeInsets.all(8),
  ),
);