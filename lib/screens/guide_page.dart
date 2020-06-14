import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GuidePage extends StatelessWidget {
  static const String Id = '/guidePage';

  static const String title = 'Guide';

  static const String iconAsset = vectorRoot + 'ic_guides.xml';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GuidePage();
      case '/list':
        return null;
      case '/text':
        return null;
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(context),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            buildChild('as_said_by_pope.jpg', 'AS SAID BY POPES'),
            buildChild('fulton_sheen.jpg',
                'EXTRACTS FROM FREQUENT CONFESSION (FULTON SHEEN)'),
            buildChild('faq.jpg', 'FAQ'),
            buildChild('ccc.jpg', 'CATHECHISM OF THE CATHOLIC CHURCH'),
            buildChild('confession.jpg', 'HOW TO MAKE A GOOD CONFESSION')
          ],
        ),
      ),
    );
  }

  Expanded buildChild(String imagePath, String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Image(
              image: AssetImage(imagesRoot + imagePath),
              color: Colors.red,
              colorBlendMode: BlendMode.hue,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Color.fromRGBO(0, 0, 0, .5),
            ),
            Container(
              width: double.infinity,
              color: Color.fromRGBO(0, 0, 0, .2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
