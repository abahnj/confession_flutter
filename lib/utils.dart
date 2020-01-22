import 'package:flutter/material.dart';

class Utils {
  static Brightness returnBrightness(
      BuildContext context, ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return MediaQuery.of(context).platformBrightness;
        break;
      case ThemeMode.light:
        return Brightness.light;
        break;
      case ThemeMode.dark:
        return Brightness.dark;
        break;
      default:
        return Brightness.light;
    }
  }
}
