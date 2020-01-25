import 'package:confession_flutter/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class GuidePage extends StatefulWidget {
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
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PlatformText('GuidePage'),
      ),
    );
  }
}
