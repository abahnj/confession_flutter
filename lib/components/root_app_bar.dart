import 'dart:io' show Platform;

import 'package:confession_flutter/screens/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../constants.dart';

AppBar rootAppBar({String title = kAppName}) {
  return AppBar(
    title: PlatformText(title),
    actions: <Widget>[
      if (Platform.isAndroid)
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      PlatformIconButton(
        onPressed: () {
          //this helps get nested navigator that is up one level
          //helpful if you have more than two navigators
          navigatorKey.currentState.pushNamed(SettingsPage.Id);
        },
        icon: Icon(
          Platform.isAndroid ? Icons.settings : CupertinoIcons.settings,
          color: Colors.red,
        ),
      ),
    ],
  );
}
