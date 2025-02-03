import 'package:flutter/material.dart';

class GlobalThemeData {
  // Tema claro
  static final ThemeData lightThemeData = ThemeData(
    fontFamily: 'Silkscreen',
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Colors.green,
      onPrimary: Colors.white,
      secondary: Colors.amber,
      onSecondary: Colors.black,
      surface: Colors.grey,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.grey[800]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
  );

  // Tema escuro
  static final ThemeData darkThemeData = ThemeData(
    fontFamily: 'Silkscreen',
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Colors.green,
      onPrimary: Colors.black,
      secondary: Colors.amber,
      onSecondary: Colors.black,
      surface: Colors.grey,
      onSurface: Colors.white,
      error: Colors.red,
      onError: Colors.black,
    ),
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.grey[300]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
  );
}
