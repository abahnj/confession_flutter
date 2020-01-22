import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/screens/confession_page.dart';
import 'package:confession_flutter/screens/examination_page.dart';
import 'package:confession_flutter/screens/guide_page.dart';
import 'package:confession_flutter/screens/prayers_page.dart';
import 'package:confession_flutter/screens/settings_page.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/avd.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  static const String Id = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> allDestinations = [
    ExaminationPage(),
    ConfessionPage(),
    GuidePage(),
    PrayersPage(),
  ];

  @override
  void initState() {
    super.initState();

    // If you want further control of the tabs have one of these
    _tabController ??= PlatformTabController(
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // This needs to be captured here in a stateful widget
  PlatformTabController _tabController;

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      appBarBuilder: (context, index) =>
          PlatformAppBar(
            title: PlatformText(kAppName),
            trailingActions: <Widget>[
              PlatformIconButton(
                onPressed: () {},
                icon: Icon(PlatformIcons(context).share),
              ),
              PlatformIconButton(
                onPressed: () {
                  print(context);
                  Navigator.of(context).pushNamed(SettingsPage.Id);
                },
                icon: Icon(PlatformIcons(context).settings),
              ),
            ],
          ),
      tabController: _tabController,
      bodyBuilder: (context, index) {
        return IndexedStack(
          index: index,
          children: allDestinations,
        );
      },
      items: _buildItems(context),
      /*ios: (_) =>
          CupertinoTabScaffoldData(tabViewDataBuilder: (context, index) {
        print(index);
        return CupertinoTabViewData(routes: {
          SettingsPage.Id: (context) => SettingsPage(),
        });
      }),*/
      androidTabs: (_) =>
          MaterialNavBarData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.red,
              iconSize: 24,
              showUnselectedLabels: false),
    );
  }
}

List<BottomNavigationBarItem> _buildItems(context) {
  var themeMode = Provider
      .of<PrefsNotifier>(context)
      .userThemeMode;
  var brightness = Utils.returnBrightness(context, themeMode);

  var inactiveColor = brightness == Brightness.dark
      ? iconColorDarkInactive
      : iconColorLightInactive;

  print(context);
  return [
    BottomNavigationBarItem(
      title: PlatformText('Examination'),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_exam.xml',
          color: inactiveColor,
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_exam.xml',
          color: iconColorActive,
        ),
      ),
    ),
    BottomNavigationBarItem(
      title: PlatformText('Confession'),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_confession.xml',
          color: inactiveColor,
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_confession.xml',
          color: iconColorActive,
        ),
      ),
    ),
    BottomNavigationBarItem(
      title: PlatformText('Guide'),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_guides.xml',
          color: inactiveColor,
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_guides.xml',
          color: iconColorActive,
        ),
      ),
    ),
    BottomNavigationBarItem(
      title: PlatformText('Prayers'),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_prayer.xml',
          color: inactiveColor,
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_prayer.xml',
          color: iconColorActive,
        ),
      ),
    ),
  ];
}
