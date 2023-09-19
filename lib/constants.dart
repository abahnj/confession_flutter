import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Constants file
const kAppName = 'Confession';

const Color iconColorLightInactive = Color.fromRGBO(0, 0, 0, .9);
final Color iconColorActive = Colors.red.withOpacity(.54);
const Color iconColorDarkInactive = Color.fromRGBO(255, 255, 255, 0.3);

const String vectorRoot = 'assets/vectors/';

const String imagesRoot = 'assets/images/';

const String GENDER_PREF = 'GENDER_PREF';
const String VOCATION_PREF = 'VOCATION_PREF';
const String AGE_PREF = 'AGE_PREF';
const String LAST_CONFESSION = 'LAST_CONFESSION';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//Route constants
const String guideListPage = '/listPage';
const String guideDetailPage = '/detailPage';
const String confessionPageTwo = 'confessionPageTwo';
const String confessionPageThree = 'confessionPageThree';
const String confessionPageFour = 'confessionPageFour';
const String confessionPage = '/';



///Themes

final themeData = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: Colors.red,
  primaryIconTheme: const IconThemeData(color: Colors.red),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: iconColorLightInactive,
  ),
);

final themeDataDark = ThemeData.dark().copyWith(
  iconTheme: const IconThemeData(color: Colors.red),
  scaffoldBackgroundColor: Colors.black,
  colorScheme: const ColorScheme.dark(background: Colors.black),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: iconColorDarkInactive,
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      dateTimePickerTextStyle: TextStyle(
        fontSize: 21,
      ),
    ),
  ),
);

// TimeOfDay const
const int SECOND_IN_MILLIS = 1000;
const int MINUTE_IN_MILLIS = 60 * SECOND_IN_MILLIS;
const int HOUR_IN_MILLIS = 60 * MINUTE_IN_MILLIS;
const int DAY_IN_MILLIS = HOUR_IN_MILLIS * 24;
const int WEEK_IN_MILLIS = 7 * DAY_IN_MILLIS;

const String SHARE_TEXT =
    'An app that helps you become the best Catholic possible. '
    'Designed to be used in the confessional, this app is the perfect aid for every penitent. '
    '\nhttps://play.google.com/store/apps/details?id=com.norvera.confession ';
