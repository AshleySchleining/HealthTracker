// Flutter imports:
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData getTheme() {
    final appTheme = ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      brightness: Brightness.light,
    );

    return appTheme;
  }
}
