import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsPage extends StatelessWidget {
  static const String Id = 'settingsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PlatformText('Settings'),
      ),
      body: Container(
        child: Center(
          child: PlatformText('Settings Page'),
        ),
      ),
    );
  }
}
