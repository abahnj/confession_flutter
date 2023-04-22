import 'dart:io' show Platform;

import 'package:confession_flutter/screens/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../constants.dart';

AppBar rootAppBar(BuildContext context, {String title = kAppName}) {
  return AppBar(
    title: PlatformText(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontFamily: 'RobotoMono'),
    ),
    actions: <Widget>[
      if (Platform.isAndroid)
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.red,
          ),
          onPressed: () {
            Share.share(SHARE_TEXT, subject: 'Share');
          },
        ),
      PlatformIconButton(
        onPressed: () {
          //this helps get nested navigator that is up one level
          //helpful if you have more than two navigators
          navigatorKey.currentState?.pushNamed(SettingsPage.Id);
        },
        icon: Icon(
          Platform.isAndroid ? Icons.settings : CupertinoIcons.settings,
          color: Colors.red,
        ),
      ),
    ],
  );
}

AppBar defaultAppBar({String title = kAppName}) {
  return AppBar(
    title: PlatformText(
      title,
      style: TextStyle(fontFamily: 'RobotoMono', fontSize: 34),
    ),
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
          navigatorKey.currentState?.pushNamed(SettingsPage.Id);
        },
        icon: Icon(
          Platform.isAndroid ? Icons.settings : CupertinoIcons.settings,
          color: Colors.red,
        ),
      ),
    ],
  );
}
