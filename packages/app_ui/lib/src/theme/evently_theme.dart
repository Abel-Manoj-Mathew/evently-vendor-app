import 'package:flutter/material.dart';
import 'package:app_ui/src/colors/evently_colors.dart';

abstract class EventlyTheme {
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: EventlyColors.primary,
        primary: EventlyColors.primary,
        error: EventlyColors.error,
        surface: EventlyColors.surface,
      ),
      scaffoldBackgroundColor: EventlyColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: EventlyColors.background,
        foregroundColor: EventlyColors.text,
        elevation: 0,
      ),
      useMaterial3: true,
    );
  }
}
