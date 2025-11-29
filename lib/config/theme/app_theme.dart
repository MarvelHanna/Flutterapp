import 'package:flutter/material.dart';

class AppTheme {
  static const _seed = Color(0xFF5568FE);
  static const _surface = Color(0xFF0F172A);

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          surface: Colors.grey.shade50,
        ),
        scaffoldBackgroundColor: Colors.grey.shade50,
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.dark,
          surface: _surface,
        ),
        scaffoldBackgroundColor: _surface,
        cardTheme: CardThemeData(
          color: const Color(0xFF111827),
          surfaceTintColor: Colors.black,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      );
}
