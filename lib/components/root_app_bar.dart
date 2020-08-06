import 'package:confession_flutter/screens/app_intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../constants.dart';

AppBar rootAppBar(BuildContext context) {
  return AppBar(
    title: PlatformText(kAppName),
    actions: <Widget>[
      if (Theme.of(context).platform == TargetPlatform.android)
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
          var state = Navigator.of(context);
          var state2 = Navigator.of(state.context);

          Navigator.of(
            state2.context,
          ).pushNamed(AppIntroPage.Id);
        },
        icon: Icon(
          PlatformIcons(context).settings,
          color: Colors.red,
        ),
      ),
    ],
  );
}
