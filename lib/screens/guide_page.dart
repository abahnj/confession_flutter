import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class GuidePage extends StatefulWidget {
  static const String Id = 'guidePage';

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
