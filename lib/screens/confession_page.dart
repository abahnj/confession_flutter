import 'package:confession_flutter/screens/prayers_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

///Confession page widget
class ConfessionPage extends StatefulWidget {
  static const String Id = 'confessionPage';

  static Function router = (name) {
    // ignore: missing_return
    switch (name) {
      case '/':
        return PrayersPage();
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
