import 'package:confession_flutter/screens/confession/confession_page.dart';
import 'package:confession_flutter/screens/destination_view.dart';
import 'package:confession_flutter/screens/exam/commandments_page.dart';
import 'package:confession_flutter/screens/guide/guide_page.dart';
import 'package:confession_flutter/screens/prayers/prayers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<Destination> _allDestinations = <Destination>[
  Destination(0, CommandmentsPage.title, CommandmentsPage.iconAsset,
      CommandmentsPage.router),
  Destination(
    1, ConfessionPage.title, ConfessionPage.iconAsset,
    //ConfessionPage router
    ConfessionPage.router,
  ),
  Destination(
    2, GuidePage.title, GuidePage.iconAsset,
    //GuidePage router
    GuidePage.router,
  ),
  Destination(
    3, PrayersPage.title, PrayersPage.iconAsset,
    //PrayersPage router
    PrayersPage.router,
  )
];

class HomePage extends StatefulWidget {
  static const String Id = '/';

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  List<Key> _destinationKeys = [];
  List<GlobalKey<NavigatorState>> _navigatorKeys = [];
  List<AnimationController> _faders = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders = List<AnimationController>.generate(
        _allDestinations.length,
        (_) => AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300)),
        growable: false);
    _faders[_currentIndex].value = 1.0;
    _destinationKeys = List<Key>.generate(
        _allDestinations.length, (int index) => GlobalKey(),
        growable: false);
    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        _allDestinations.length, (int index) => GlobalKey(),
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
      onWillPop: () async {
        return !(await _navigatorKeys[_currentIndex].currentState?.maybePop() ??
            false);
      },
      child: Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: _allDestinations.map((Destination destination) {
              final Widget view = FadeTransition(
                opacity: _faders[destination.index]
                    .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                child: KeyedSubtree(
                  key: _destinationKeys[destination.index],
                  child: DestinationView(
                    navigatorKey: _navigatorKeys[destination.index],
                    onNavigation: () {},
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              if (index == _currentIndex) {
                var currentNavigator = _navigatorKeys[_currentIndex];
                currentNavigator.currentState
                    ?.popUntil((route) => route.isFirst);
                return;
              } else {
                _currentIndex = index;
              }
            });
          },
          items: _buildItems(context),
        ),
      ),
    );
  }
}

List<BottomNavigationBarItem> _buildItems(context) {
  return _allDestinations.map((Destination destination) {
    return BottomNavigationBarItem(
      label: destination.title,
      icon: SizedBox(
        height: 24,
        width: 24,
        child: SvgPicture.asset(
          destination.iconAsset,
          colorFilter: ColorFilter.mode(
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
                  Colors.grey,
              BlendMode.srcIn),
        ),
      ),
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: SvgPicture.asset(
          destination.iconAsset,
          theme:SvgTheme(currentColor:  Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? const Color(0xFF000000)),
        ),
      ),
    );
  }).toList();
}
