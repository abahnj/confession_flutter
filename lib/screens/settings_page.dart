import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const String Id = 'settingsPage';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoSettings(
              items: <Widget>[
                CSHeader('APPEARANCE'),
                CSSelection<ThemeMode>(
                  onSelected: (themeMode) {
                    Provider.of<PrefsNotifier>(context, listen: false)
                        .userThemeMode = themeMode;
                  },
                  currentSelection:
                      Provider.of<PrefsNotifier>(context).userThemeMode,
                  items: [
                    CSSelectionItem(
                      value: ThemeMode.system,
                      text: 'System',
                    ),
                    CSSelectionItem(
                      value: ThemeMode.dark,
                      text: 'Dark',
                    ),
                    CSSelectionItem(
                      value: ThemeMode.light,
                      text: 'Light',
                    ),
                  ],
                ),
                CSHeader('PROFILE'),
                CSLink(
                  title: 'Profile',
                  detail: Provider.of<PrefsNotifier>(context).user.toString(),
                  cellType: CellType.detailRightStyle,
                  onPressed: () {
                    Navigator.of(context).pushNamed(ProfilePage.Id);
                  },
                ),
                CSHeader(''),
                CSButton(
                  CSButtonType.DEFAULT,
                  'Share',
                  () {
                    print('It works!');
                  },
                  style: CSWidgetStyle(
                    icon: Icon(
                      CupertinoIcons.share,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ),
                CSButton(
                  CSButtonType.DEFAULT,
                  'Send Feedback',
                  () {
                    print('It works!');
                  },
                  style: CSWidgetStyle(
                    icon: Icon(
                      CupertinoIcons.reply,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ),
                CSDescription(
                  'Report technical issues or suggest new features.',
                ),
                CSHeader(''),
                CSButton(CSButtonType.DESTRUCTIVE, 'Reset App', () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                            title: Text('Reset App'),
                            content: Text('Are you sure?'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text('No'),
                                isDefaultAction: true,
                                onPressed: () {
                                  UnimplementedError('Implement me');
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text('Yes'),
                                isDestructiveAction: true,
                                onPressed: () {
                                  UnimplementedError('Implement me');
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                      useRootNavigator: false);
                }),
                CSDescription(
                  'WARNING! This will delete all personal application data including added examinations',
                ),
              ],
            )
          : null,
    );
  }
}
