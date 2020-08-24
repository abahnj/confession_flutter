import 'package:confession_flutter/components/confession_page_button.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/screens/confession/confession_page_three.dart';
import 'package:confession_flutter/screens/confession/confession_page_two.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Confession page widget
class ConfessionPage extends StatelessWidget {
  static const String Id = 'confessionPage';

  static const String title = 'Confession';

  static const String iconAsset = vectorRoot + 'ic_confession.xml';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case confessionPage:
        return ConfessionPage();
      case confessionPageTwo:
        return ConfessionPageTwo();
      case confessionPageThree:
        return ConfessionPageThree();
    }
  };

  @override
  Widget build(BuildContext context) {
    var timeSinceLast = context.select((User user) => user.lastConfession);
    var timeSinceRepresentation = getTimeAgo(timeSinceLast);
    return Scaffold(
      appBar: rootAppBar(context),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        'Its been $timeSinceRepresentation since my last confession',
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
            ),
            Text(
              'THIS APP IS INTENDED TO BE USED DURING THE SACRAMENT OF '
              'RECONCILIATION WITH A CATHOLIC PRIEST ONLY. '
              'THIS IS NOT A SUBSTITUTE FOR A VALID CONFESSION',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontSize: 12,
                    color: Colors.red,
                  ),
              textAlign: TextAlign.center,
            ),
            ConfessionPageButton(
              onTap: () => Navigator.pushNamed(context, confessionPageTwo),
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
