import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/provider_setup.dart';
import 'package:confession_flutter/screens/app_intro_page.dart';
import 'package:confession_flutter/screens/app_lock_page.dart';
import 'package:confession_flutter/screens/home_page.dart';
import 'package:confession_flutter/screens/settings_page.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
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
      darkTheme: ThemeData.dark().copyWith(
        iconTheme: IconThemeData(color: Colors.red),
      ),
      themeMode: _userThemeMode(context),
      theme: ThemeData(
        brightness: _setBrightness(context),
        bottomAppBarColor: Colors.red,
        primarySwatch: Colors.red,
        primaryIconTheme: IconThemeData(color: Colors.red),
        accentIconTheme: IconThemeData(color: Colors.red),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.black54),
              subhead: TextStyle(fontFamily: 'Garamond', fontSize: 18.0),
            ),
      ),
      routes: {
        HomePage.Id: (context) => HomePage(),
        AppIntroPage.Id: (context) => AppIntroPage(),
        AppLockPage.Id: (context) => AppLockPage(),
        SettingsPage.Id: (context) => SettingsPage()
      },
    );
  }
}

ThemeMode _userThemeMode(context) =>
    Provider.of<PrefsNotifier>(context).userThemeMode;

Brightness _setBrightness(BuildContext context) {
  var themeMode = _userThemeMode(context);

  return Utils.returnBrightness(context, themeMode);
}
