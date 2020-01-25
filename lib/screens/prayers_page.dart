import 'package:confession_flutter/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PrayersPage extends StatefulWidget {
  static const String Id = '/prayersPage';

  static const String title = 'Prayers';

  static const String iconAsset = vectorRoot + 'ic_prayer.xml';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PrayersPage();
      case '/list':
        return null;
      case '/text':
        return null;
    }
  };

  @override
  _PrayersPageState createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PlatformText('PrayersPage'),
      ),
    );
  }
}
