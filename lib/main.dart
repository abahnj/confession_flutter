import 'package:confession_flutter/provider_setup.dart';
import 'package:confession_flutter/screens/app_intro_page.dart';
import 'package:confession_flutter/screens/app_lock_page.dart';
import 'package:confession_flutter/screens/home_page.dart';
import 'package:confession_flutter/screens/settings/profile_page.dart';
import 'package:confession_flutter/screens/settings_page.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'screens/app_lock.dart';

void main() => runApp(
      MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          home: AppLock(
            builder: (args) => MyApp(),
            lockScreen: PassCodeScreen(),
          ),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confession',
      debugShowCheckedModeBanner: false,
      darkTheme: themeDataDark,
      themeMode: userThemeMode(context),
      theme: themeData(context),
      navigatorKey: navigatorKey,
      routes: {
        HomePage.Id: (context) => HomePage(),
        AppIntroPage.Id: (context) => AppIntroPage(),
        SettingsPage.Id: (context) => SettingsPage(),
        ProfilePage.Id: (context) => ProfilePage()
      },
    );
  }
}
