import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppLockPage extends StatefulWidget {
  static const String Id = 'appLockPage';

  @override
  _AppLockPageState createState() => _AppLockPageState();
}

class _AppLockPageState extends State<AppLockPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PlatformText('AppLockPage'),
      ),
    );
  }
}
