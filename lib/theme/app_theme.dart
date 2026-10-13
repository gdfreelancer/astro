import 'package:flutter/material.dart';

class AppTheme {
  static const ink = Color(0xFF18283D);
  static const navy = Color(0xFF142438);
  static const saffron = Color(0xFFE9A23B);
  static const paper = Color(0xFFF6F4EF);
  static const muted = Color(0xFF7B8794);
  static const jade = Color(0xFF3C8C78);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: paper,
    colorScheme: ColorScheme.fromSeed(seedColor: ink, primary: ink, surface: paper),
    appBarTheme: const AppBarTheme(backgroundColor: paper, foregroundColor: ink, elevation: 0),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: saffron.withValues(alpha: .2),
      height: 72,
    ),
  );
}
