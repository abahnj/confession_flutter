import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/screens/profile_page.dart';
import 'package:confession_flutter/utils.dart';
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
    var prefs = Provider.of<PrefsNotifier>(context, listen: false);

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
                    Provider.of<ThemeStyle>(context, listen: false)
                        .userThemeMode = themeMode;
                  },
                  currentSelection:
                      Provider.of<ThemeState>(context).userThemeMode,
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
                CSLink(
                  //todo make adaptive t paltform brightness
                  title: 'Date of Last Confession',
                  detail: '1st january 1970',
                  cellType: CellType.detailRightStyle,
                  onPressed: () {
                    return showCupertinoModalPopup(
                      context: context,
                      useRootNavigator: false,
                      builder: (context) => Container(
                        height: 300,
                        child: CupertinoDatePicker(
                          backgroundColor: CupertinoColors
                              .secondarySystemBackground.darkColor,
                          minimumYear: 2000,
                          initialDateTime: DateTime.now(),
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (date) {
                            print(date);
                          },
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ),
                    );
                  },
                ),
                CSHeader(''),
                CSButton(
                  child: Text('Share'),
                  pressed: () {
                    print('It works!');
                  },
                  buttonType: CSButtonType.DEFAULT,
                  style: CSWidgetStyle(
                    icon: Icon(
                      CupertinoIcons.share,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ),
                CSButton(
                  child: Text('Send Feedback'),
                  pressed: () {
                    print('It works!');
                  },
                  buttonType: CSButtonType.DEFAULT,
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
                CSButton(
                    buttonType: CSButtonType.DESTRUCTIVE,
                    child: Text('Reset App'),
                    pressed: () {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) =>
                              CupertinoAlertDialog(
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
          : ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Gender',
                  ),
                  subtitle: Text(
                    Utils.getEnumTitle(
                      prefs.user.gender.toString(),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      useRootNavigator: false,
                      builder: (context) => SimpleDialog(
                        title: Center(
                          child: Text(
                            'Gender',
                          ),
                        ),
                        children: <Widget>[
                          RadioListTile<Gender>(
                            title: Text('Male'),
                            value: Gender.male,
                            groupValue: prefs.user.gender,
                            onChanged: (gender) {
                              prefs.userGender = gender;
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<Gender>(
                            title: Text('Female'),
                            value: Gender.female,
                            groupValue: prefs.user.gender,
                            onChanged: (gender) {
                              prefs.userGender = gender;
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Age',
                  ),
                  subtitle: Text(
                    Utils.getEnumTitle(
                      prefs.user.age.toString(),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      useRootNavigator: false,
                      builder: (context) => SimpleDialog(
                        title: Center(
                          child: Text(
                            'Age',
                          ),
                        ),
                        children: <Widget>[
                          RadioListTile<Age>(
                            title: Text('Adult'),
                            value: Age.adult,
                            groupValue: prefs.user.age,
                            onChanged: (age) {
                              prefs.userAge = age;
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<Age>(
                            title: Text('Teen'),
                            value: Age.teen,
                            groupValue: prefs.user.age,
                            onChanged: (age) {
                              prefs.userAge = age;
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<Age>(
                            title: Text('Child'),
                            value: Age.child,
                            groupValue: prefs.user.age,
                            onChanged: (age) {
                              prefs.userAge = age;
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Vocation',
                  ),
                  subtitle: Text(
                    Utils.getEnumTitle(
                      prefs.user.vocation.toString(),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      useRootNavigator: false,
                      builder: (context) => SimpleDialog(
                        title: Center(
                          child: Text(
                            'Vocation',
                          ),
                        ),
                        children: <Widget>[
                          RadioListTile<Vocation>(
                            title: Text('Single'),
                            value: Vocation.single,
                            groupValue: prefs.user.vocation,
                            onChanged: (vocation) {
                              prefs.userVocation = vocation;
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<Vocation>(
                            title: Text('Married'),
                            value: Vocation.married,
                            groupValue: prefs.user.vocation,
                            onChanged: (vocation) {
                              prefs.userVocation = vocation;
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<Vocation>(
                            title: Text('Priest'),
                            value: Vocation.priest,
                            groupValue: prefs.user.vocation,
                            onChanged: (vocation) {
                              prefs.userVocation = vocation;
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<Vocation>(
                            title: Text('Religious'),
                            value: Vocation.religious,
                            groupValue: prefs.user.vocation,
                            onChanged: (vocation) {
                              prefs.userVocation = vocation;
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Date of Last Confession',
                  ),
                  subtitle: Text('1 January 1970'),
                  onTap: () {
                    showDatePicker(
                        context: context,
                        useRootNavigator: false,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime.now());
                  },
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    'Reset App',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text(
                    'Reset App',
                  ),
                  subtitle: Text(
                    'WARNING! This will delete all personal application data including added examinations',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Text(
                    'Help',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text(
                    'Send Feedback',
                  ),
                  subtitle: Text(
                    'Report technical issues or suggest new features',
                  ),
                ),
              ],
            ),
    );
  }
}
