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

String getTimeAgo(String time) {
  var diff = DateTime.now().difference(DateTime.parse(time));

  if (diff.isNegative) {
    return 'invalid';
  }

  var days = diff.inDays;
  var weeks = (days / 7).floor();
  var months = (days / 30).floor();
  var years = (days / 365).floor();

  if (years > 0) {
    return years == 1 ? 'a year' : '$years years';
  } else if (months > 0) {
    return months == 1 ? 'a month' : '$months months';
  } else if (weeks > 0) {
    return weeks == 1 ? 'a week' : '$weeks weeks';
  } else if (days > 1) {
    return '$days days';
  } else {
    return 'a day';
  }
}
