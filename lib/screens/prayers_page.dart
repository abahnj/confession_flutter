import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PrayersPage extends StatefulWidget {
  static const String Id = 'prayersPage';

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
