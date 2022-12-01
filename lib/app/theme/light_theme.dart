import 'package:book_bank/app/theme/app_constants.dart';
import 'package:book_bank/app/theme/colors.dart';
import 'package:flutter/material.dart';

getLightTheme() {
  final base = ThemeData.light().copyWith(
      colorScheme: defaultColorScheme,
      scaffoldBackgroundColor: defaultColorScheme.background,
      cardTheme: const CardTheme(
        elevation: 12.0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.amber,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
          borderSide: BorderSide(
            color: defaultColorScheme.onSurface,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius + 4),
          borderSide: BorderSide(
            color: defaultColorScheme.onSurface,
            width: 1.0,
          ),
        ),
      ));
  return base;
}
