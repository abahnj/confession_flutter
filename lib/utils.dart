import 'package:confession_flutter/theme_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  static String getEnumTitle(String value) {
    return value.split('.').last[0].toUpperCase() +
        value.split('.').last.substring(1);
  }
}

ThemeMode userThemeMode(context) =>
    Provider.of<ThemeState>(context).userThemeMode;

Brightness setBrightness(BuildContext context) {
  var themeMode = userThemeMode(context);

  return Utils.returnBrightness(context, themeMode);
}
