import 'package:flutter/material.dart';

class AppTheme {
  // Spotify Colors
  static const Color spotifyGreen = Color(0xFF1DB954);
  static const Color spotifyBlack = Color(0xFF191414);
  static const Color spotifyDarkGray = Color(0xFF282828);
  static const Color spotifyMediumGray = Color(0xFF535353);
  static const Color spotifyLightGray = Color(0xFFB3B3B3);
  static const Color spotifyWhite = Color(0xFFFFFFFF);

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: spotifyGreen,
        brightness: Brightness.light,
        primary: spotifyGreen,
        secondary: spotifyGreen,
        surface: spotifyWhite,
        background: spotifyWhite,
        onPrimary: spotifyWhite,
        onSecondary: spotifyWhite,
        onSurface: spotifyBlack,
        onBackground: spotifyBlack,
      ),
      scaffoldBackgroundColor: spotifyWhite,
      appBarTheme: const AppBarTheme(
        backgroundColor: spotifyWhite,
        foregroundColor: spotifyBlack,
        elevation: 0,
        centerTitle: true,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: spotifyWhite,
        indicatorColor: spotifyGreen.withOpacity(0.1),
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
      cardTheme: CardTheme(
        color: spotifyWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: spotifyGreen,
          foregroundColor: spotifyWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: spotifyBlack,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: spotifyBlack,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: spotifyBlack,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: spotifyBlack,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: spotifyBlack,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: spotifyBlack,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: spotifyBlack,
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: spotifyGreen,
        brightness: Brightness.dark,
        primary: spotifyGreen,
        secondary: spotifyGreen,
        surface: spotifyDarkGray,
        background: spotifyBlack,
        onPrimary: spotifyWhite,
        onSecondary: spotifyWhite,
        onSurface: spotifyWhite,
        onBackground: spotifyWhite,
      ),
      scaffoldBackgroundColor: spotifyBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: spotifyBlack,
        foregroundColor: spotifyWhite,
        elevation: 0,
        centerTitle: true,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: spotifyBlack,
        indicatorColor: spotifyGreen.withOpacity(0.1),
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
      cardTheme: CardTheme(
        color: spotifyDarkGray,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: spotifyGreen,
          foregroundColor: spotifyWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: spotifyWhite,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: spotifyWhite,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: spotifyWhite,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: spotifyWhite,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: spotifyWhite,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: spotifyWhite,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: spotifyWhite,
        ),
      ),
    );
  }
}
