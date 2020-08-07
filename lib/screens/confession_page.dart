import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

///Confession page widget
class ConfessionPage extends StatelessWidget {
  static const String Id = 'confessionPage';

  static const String title = 'Confession';

  static const String iconAsset = vectorRoot + 'ic_confession.xml';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return ConfessionPage();
      case '/list':
        return null;
      case '/text':
        return null;
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'In the Name of The Father and The Son and The Holy Spirit',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Amen',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Bless me Father for I have sinned',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Its been 6 days since my last confession',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Here are my sins',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'THIS APP IS INTENDED TO BE USED DURING THE SACRAMENT OF RECONCILIATION WITH A CATHOLIC PRIEST ONLY. THIS IS NOT A SUBSTITUE FOR A VALID CONFESSION',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontSize: 12,
                    color: Colors.red,
                  ),
              textAlign: TextAlign.center,
            ),
            PlatformButton(
              child: Text(
                'Next',
                style:
                    Theme.of(context).textTheme.button.copyWith(fontSize: 16),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
