import 'dart:io';

import 'package:confession_flutter/theme_prefs.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Brightness returnBrightness(BuildContext context) {
    var themeMode = userThemeMode(context);
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
  return Utils.returnBrightness(context);
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

String getDateString(BuildContext context, String date) {
  var myLocale = Localizations.localeOf(context);

  return DateFormat.yMMMEd(myLocale.toLanguageTag())
      .format(DateTime.parse(date));
}

Future<String> getDeviceInfo() async {
  var deviceInfo = DeviceInfoPlugin();
  var packageInfo = await PackageInfo.fromPlatform();

  var appVersion =
      '${packageInfo.appName}  ${packageInfo.buildNumber}  ${packageInfo.version}';

  var deviceOS;
  var osVersion;
  var deviceBrand;
  var deviceModel;
  var deviceManufacturer;

  if (Platform.isIOS) {
    var iosInfo = await deviceInfo.iosInfo;
    deviceOS = iosInfo.systemName;
    osVersion = iosInfo.systemVersion;
    deviceBrand = iosInfo.utsname;
    deviceModel = iosInfo.localizedModel;
    deviceManufacturer = 'Apple';
  } else {
    var androidInfo = await deviceInfo.androidInfo;
    deviceOS = androidInfo.version.sdkInt;
    osVersion = androidInfo.version.release;
    deviceBrand = androidInfo.brand;
    deviceModel = androidInfo.model;
    deviceManufacturer = androidInfo.manufacturer;
  }

  return '''
      \n\n----------------------------- \n Please don't remove this information
      \n Device OS: $deviceOS \n 
      Device OS version: $osVersion \n 
      App Version: $appVersion \n 
      Device Brand: $deviceBrand \n 
      Device Model: $deviceModel\n 
      Device Manufacturer: $deviceManufacturer
      ''';
}

void sendFeedbackEmail() async {
  var emailUri = getUrl('mailto', 'appsupport@norvera.com',
      {'subject': 'Feedback for Confession', 'body': await getDeviceInfo()});
  if (await canLaunch(emailUri)) {
    await launch(emailUri);
  } else {
    throw 'Could not launch $emailUri';
  }
}

String getUrl(String scheme, String path, Map<String, String> queryParameters) {
  var url = '$scheme:$path?';

  queryParameters.forEach((String k, String v) {
    url += '$k=$v&';
  });

  return url;
}
