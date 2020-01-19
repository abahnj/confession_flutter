import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppIntroPage extends StatefulWidget {
  static const String Id = 'appIntroPage';

  @override
  _AppIntroPageState createState() => _AppIntroPageState();
}

class _AppIntroPageState extends State<AppIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PlatformText('AppIntroPage'),
      ),
    );
  }
}
