import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/screens/settings/android_settings_page.dart';
import 'package:confession_flutter/screens/settings/ios_settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const String Id = 'settingsPage';

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Theme.of(context).platform == TargetPlatform.iOS
          ? iOSSettingsPage(prefs: prefs)
          : AndroidSettingsPage(prefs: prefs),
    );
  }
}
