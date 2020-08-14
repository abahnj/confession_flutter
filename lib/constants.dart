import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';

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

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//Route constants
const String guideListPage = '/listPage';
const String guideDetailPage = '/detailPage';
const String confessionPageTwo = 'confessionPageTwo';
const String confessionPageThree = 'confessionPageThree';
const String confessionPageFour = 'confessionPageFour';
const String confessionPage = '/';

const iosStrings = IOSAuthMessages(
    cancelButton: 'cancel',
    goToSettingsButton: 'settings',
    goToSettingsDescription: 'Please set up your Touch ID.',
    lockOut: 'Please re-enable your Touch ID');

///Themes
///

final themeData = (BuildContext context) => ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      primaryIconTheme: IconThemeData(color: Colors.red),
      accentIconTheme: IconThemeData(color: Colors.red),
      primaryColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.red,
        unselectedItemColor: iconColorLightInactive,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            inherit: false,
            fontFamily: '.SF Pro Display',
            fontSize: 21,
            fontWeight: FontWeight.normal,
            color: CupertinoColors.black,
          ),
        ),
      ),
    );

final themeDataDark = ThemeData.dark().copyWith(
  iconTheme: IconThemeData(color: Colors.red),
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  toggleableActiveColor: Colors.red,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: iconColorDarkInactive,
  ),
  cupertinoOverrideTheme: CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      dateTimePickerTextStyle: TextStyle(
        inherit: false,
        fontFamily: '.SF Pro Display',
        fontSize: 21,
        fontWeight: FontWeight.normal,
        color: CupertinoColors.white,
      ),
    ),
  ),
);
