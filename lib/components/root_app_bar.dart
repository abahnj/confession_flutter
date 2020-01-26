import 'package:confession_flutter/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../constants.dart';

AppBar rootAppBar(BuildContext context) {
  return AppBar(
    title: PlatformText(kAppName),
    actions: <Widget>[
      PlatformIconButton(
        onPressed: () {
          //this helps get nested navigator that is up one level
          //helpful if you have more than two navigators
          var state = Navigator.of(context);

          Navigator.of(state.context).pushNamed(SettingsPage.Id);
        },
        icon: Icon(
          PlatformIcons(context).settings,
          color: Colors.red,
        ),
      ),
    ],
  );
}
