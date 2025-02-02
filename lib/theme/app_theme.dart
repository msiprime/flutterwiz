import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.black;
  static const secondary = Color(0xFF1A1A1A);
  static const tertiary = Color(0xFF333333);
  static const neutral = Color(0xFF4D4D4D);
  static const neutralVariant = Color(0xFF666666);

  static const darkScaffoldBackground = Color(0xFF212121);
  static const darkSurfaceBackground = Color(0xFF303030);

  static const darkText = Colors.white;
  static const darkTextLight = Color(0xFFDDDDDD);

  static const darkIcon = Colors.white;
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: AppColors.secondary),
      titleTextStyle: TextStyle(color: AppColors.primary),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.primary),
      bodyLarge: TextStyle(color: AppColors.secondary),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.neutralVariant,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    appBarTheme: AppBarTheme(
      color: AppColors.darkSurfaceBackground,
      iconTheme: IconThemeData(color: AppColors.darkIcon),
      titleTextStyle: TextStyle(color: AppColors.darkText),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.darkText),
      bodyLarge: TextStyle(color: AppColors.darkTextLight),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkSurfaceBackground,
      onPrimary: AppColors.darkText,
      onSecondary: AppColors.darkText,
    ),
  );
}
