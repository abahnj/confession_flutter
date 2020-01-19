import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsPage extends StatelessWidget {
  static const String Id = 'settingsPage';

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('Settings'),
        leading: PlatformIconButton(
          icon: Icon(PlatformIcons(context).back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Center(
          child: PlatformText('Settings Page'),
        ),
      ),
    );
  }
}
