import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/screens/guide/guide_detail_page.dart';
import 'package:confession_flutter/screens/guide/guide_list_page.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  static const String Id = '/guidePage';

  static const String title = 'Guide';

  static const String iconAsset = '${vectorRoot}guides.svg';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return const GuidePage();
      case guideListPage:
        var guideItem = settings.arguments as GuideItem;
        return GuideListPage(
          guideId: guideItem.guideId,
          title: guideItem.guideTitle,
        );
      case guideDetailPage:
        var guideText = settings.arguments as String;
        return GuideDetailPage(
          guideText: guideText,
        );
    }
  };

  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(context, title: title),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          buildChild(
            context,
            GuideItem(2, 'AS SAID BY POPES', 'as_said_by_pope.jpg'),
          ),
          buildChild(
            context,
            GuideItem(3, 'EXTRACTS FROM FREQUENT CONFESSION (FULTON SHEEN)',
                'fulton_sheen.jpg'),
          ),
          buildChild(
            context,
            GuideItem(1, 'FAQ', 'faq.jpg'),
          ),
          buildChild(
            context,
            GuideItem(4, 'CATECHISM OF THE CATHOLIC CHURCH', 'ccc.jpg'),
          ),
          buildChild(
            context,
            GuideItem(5, 'HOW TO MAKE A GOOD CONFESSION', 'confession.jpg'),
          ),
        ],
      ),
    );
  }

  Widget buildChild(BuildContext context, GuideItem guideItem) {
    return Expanded(
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, guideListPage, arguments: guideItem),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Image(
                image: AssetImage(imagesRoot + guideItem.imagePath),
                color: Colors.red,
                colorBlendMode: BlendMode.hue,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                color: const Color.fromRGBO(0, 0, 0, .5),
              ),
              Container(
                width: double.infinity,
                color: const Color.fromRGBO(0, 0, 0, .2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    guideItem.guideTitle,
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// A ListItem that contains data to display a message.
class GuideItem {
  final int guideId;
  final String guideTitle;
  final String imagePath;

  GuideItem(this.guideId, this.guideTitle, this.imagePath);
}
