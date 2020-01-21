import 'package:confession_flutter/screens/confession_page.dart';
import 'package:confession_flutter/screens/examination_page.dart';
import 'package:confession_flutter/screens/guide_page.dart';
import 'package:confession_flutter/screens/prayers_page.dart';
import 'package:confession_flutter/screens/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/avd.dart';

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

  final _items = [
    BottomNavigationBarItem(
      title: PlatformText('Examination'),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_exam.xml',
          color: Color.fromRGBO(0, 0, 0, .26),
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_exam.xml',
          color: Colors.red,
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
          color: Color.fromRGBO(0, 0, 0, .26),
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_confession.xml',
          color: Colors.red,
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
          color: Color.fromRGBO(0, 0, 0, .26),
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_guides.xml',
          color: Colors.red,
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
          color: Color.fromRGBO(0, 0, 0, .26),
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          'assets/vectors/ic_prayer.xml',
          color: Colors.red,
        ),
      ),
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

  @override
  void dispose() {
    super.dispose();
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
          iconSize: 24,
          showUnselectedLabels: false),
    );
  }
}
