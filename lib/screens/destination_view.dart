import 'package:flutter/material.dart';

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != '/') {
      onNavigation();
    }
    //onNavigation();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != '/') {
      onNavigation();
    }
  }
}

class Destination {
  const Destination(
    this.index,
    this.title,
    this.iconAsset,
    this.router,
  );
  final int index;
  final String title;
  final String iconAsset;
  final Function router;
}

class DestinationView extends StatefulWidget {
  const DestinationView({
    Key? key,
    required this.destination,
    required this.onNavigation,
    required this.navigatorKey,
  }) : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;
  final Key navigatorKey;

  @override
  DestinationViewState createState() => DestinationViewState();
}

class DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) =>
              widget.destination.router(settings),
        );
      },
    );
  }
}
