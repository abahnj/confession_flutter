import 'package:confession_flutter/screens/confession_page.dart';
import 'package:confession_flutter/screens/examination_page.dart';
import 'package:confession_flutter/screens/guide_page.dart';
import 'package:confession_flutter/screens/prayers_page.dart';
import 'package:confession_flutter/screens/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  static const String Id = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> allDestinations = [
    ExaminationPage(),
    ConfessionPage(),
    GuidePage(),
    PrayersPage(),
  ];

  final _items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/vectors/firefox_logo.svg',
        height: 24,
        width: 24,
      ),
      title: PlatformText(
        'Exam',
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dehaze),
      title: PlatformText('Confession'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dehaze),
      title: PlatformText('Guide'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.aspect_ratio),
      title: PlatformText('Prayers'),
    ),
  ];

  @override
  void initState() {
    super.initState();

    // If you want further control of the tabs have one of these
    _tabController ??= PlatformTabController(
      initialIndex: 0,
    );
  }

  // This needs to be captured here in a stateful widget
  PlatformTabController _tabController;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      itemChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      appBarBuilder: (context, index) => PlatformAppBar(
        title: PlatformText(kAppName),
        trailingActions: <Widget>[
          PlatformIconButton(
            onPressed: () {},
            icon: Icon(PlatformIcons(context).share),
          ),
          PlatformIconButton(
            onPressed: () {
              print(context);
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(SettingsPage.Id);
            },
            icon: Icon(PlatformIcons(context).settings),
          ),
        ],
      ),
      tabController: _tabController,
      bodyBuilder: (context, index) => IndexedStack(
        index: _currentIndex,
        children: allDestinations,
      ),
      items: _items,
      androidTabs: (_) => MaterialNavBarData(
          type: BottomNavigationBarType.fixed,
          iconSize: 36,
          showUnselectedLabels: true),
    );
  }
}
