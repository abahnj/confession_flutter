import 'package:confession_flutter/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

///Confession page widget
class ConfessionPage extends StatefulWidget {
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
  _ConfessionPageState createState() => _ConfessionPageState();
}

class _ConfessionPageState extends State<ConfessionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PlatformText('ConfessionPage'),
      ),
    );
  }
}
