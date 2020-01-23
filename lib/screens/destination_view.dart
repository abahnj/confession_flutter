import 'package:flutter/material.dart';

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
  const DestinationView({Key key, this.destination, this.navigatorKey})
      : super(key: key);

  final Destination destination;
  final Key navigatorKey;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return widget.destination.router(settings.name);
          },
        );
      },
    );
  }
}
