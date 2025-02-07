import 'package:flutter/material.dart';

import './app_palette.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkTheme = ThemeData.dark().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(18),
      border: _border(),
      focusedBorder: _border(AppPalette.gradient2),
      errorBorder: _border(AppPalette.errorColor),
      enabledBorder: _border(),
    ),
  );
}
