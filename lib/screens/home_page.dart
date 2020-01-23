import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/screens/confession_page.dart';
import 'package:confession_flutter/screens/destination_view.dart';
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

final List<Destination> allDestinations = <Destination>[
  Destination(0, ExaminationPage.title, ExaminationPage.iconAsset,
      ExaminationPage.router),
  Destination(
    1, 'Confession', 'assets/vectors/ic_confession.xml',
    //ConfessionPage router
    ConfessionPage.router,
  ),
  Destination(
    2, 'Guide', 'assets/vectors/ic_guides.xml',
    //GuidePage router
    GuidePage.router,
  ),
  Destination(
    3, 'Prayers', 'assets/vectors/ic_prayer.xml',
    //PrayersPage router
    PrayersPage.router,
  )
];

class HomePage extends StatefulWidget {
  static const String Id = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  List<Key> _destinationKeys;
  List<GlobalKey<NavigatorState>> _navigatorKeys;
  List<AnimationController> _faders;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders = List<AnimationController>.generate(
        allDestinations.length,
        (_) => AnimationController(
            vsync: this, duration: Duration(milliseconds: 200)),
        growable: false);
    _faders[_currentIndex].value = 1.0;
    _destinationKeys = List<Key>.generate(
        allDestinations.length, (int index) => GlobalKey(),
        growable: false);
    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (int index) => GlobalKey(),
        growable: false);
  }

  @override
  void dispose() {
    for (var controller in _faders) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await _navigatorKeys[_currentIndex].currentState.maybePop(),
      child: Scaffold(
        appBar: AppBar(
          title: PlatformText(kAppName),
          actions: <Widget>[
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
        body: SafeArea(
          child: Stack(
              fit: StackFit.expand,
              children: allDestinations.map((Destination destination) {
                final Widget view = FadeTransition(
                  opacity: _faders[destination.index]
                      .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                  child: KeyedSubtree(
                    key: _destinationKeys[destination.index],
                    child: DestinationView(
                      navigatorKey: _navigatorKeys[destination.index],
                      destination: destination,
                    ),
                  ),
                );
                if (destination.index == _currentIndex) {
                  _faders[destination.index].forward();
                  return view;
                } else {
                  _faders[destination.index].reverse();
                  if (_faders[destination.index].isAnimating) {
                    return IgnorePointer(child: view);
                  }
                  return Offstage(child: view);
                }
              }).toList()),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: _buildItems(context),
        ),
      ),
    );
  }
}

List<BottomNavigationBarItem> _buildItems(context) {
  var themeMode = Provider.of<PrefsNotifier>(context).userThemeMode;
  var brightness = Utils.returnBrightness(context, themeMode);

  var inactiveColor = brightness == Brightness.dark
      ? iconColorDarkInactive
      : iconColorLightInactive;

  return allDestinations.map((Destination destination) {
    return BottomNavigationBarItem(
      title: PlatformText(destination.title),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          destination.iconAsset,
          color: inactiveColor,
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: AvdPicture.asset(
          destination.iconAsset,
          color: iconColorActive,
        ),
      ),
    );
  }).toList();
}
