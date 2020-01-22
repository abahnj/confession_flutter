import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/provider_setup.dart';
import 'package:confession_flutter/screens/app_intro_page.dart';
import 'package:confession_flutter/screens/app_lock_page.dart';
import 'package:confession_flutter/screens/confession_page.dart';
import 'package:confession_flutter/screens/examination_page.dart';
import 'package:confession_flutter/screens/guide_page.dart';
import 'package:confession_flutter/screens/home_page.dart';
import 'package:confession_flutter/screens/prayers_page.dart';
import 'package:confession_flutter/screens/settings_page.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: providers,
        child: PlatformApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Confession',
      debugShowCheckedModeBanner: false,
      android: (_) => MaterialAppData(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.purpleAccent,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: _userThemeMode(context),
      ),
      ios: (_) => CupertinoAppData(
        theme: CupertinoThemeData(
          brightness: _setBrightness(context),
          primaryColor: Colors.red,
        ),
      ),
      routes: {
        HomePage.Id: (context) => HomePage(),
        ExaminationPage.Id: (context) => ExaminationPage(),
        ConfessionPage.Id: (context) => ConfessionPage(),
        GuidePage.Id: (context) => GuidePage(),
        PrayersPage.Id: (context) => PrayersPage(),
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
