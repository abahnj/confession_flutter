import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/theme_prefs.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AndroidSettingsPage extends StatelessWidget {
  const AndroidSettingsPage({
    Key key,
    @required this.prefs,
  }) : super(key: key);

  final PrefsNotifier prefs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16),
          child: Text(
            'Appearance',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Theme',
          ),
          subtitle: Text(
            Utils.getEnumTitle(
              context
                  .select((ThemeState value) => value.userThemeMode.toString()),
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
                  RadioListTile<ThemeMode>(
                    title: Text('System'),
                    value: ThemeMode.system,
                    groupValue: context.watch<ThemeState>().userThemeMode,
                    onChanged: (gender) {
                      context.read<ThemeStyle>().userThemeMode =
                          ThemeMode.system;
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text('Dark'),
                    value: ThemeMode.dark,
                    groupValue: context.watch<ThemeState>().userThemeMode,
                    onChanged: (gender) {
                      context.read<ThemeStyle>().userThemeMode = ThemeMode.dark;
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text('Light'),
                    value: ThemeMode.light,
                    groupValue: context.watch<ThemeState>().userThemeMode,
                    onChanged: (gender) {
                      context.read<ThemeStyle>().userThemeMode =
                          ThemeMode.light;
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
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
                      prefs.setUserGender(gender);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Gender>(
                    title: Text('Female'),
                    value: Gender.female,
                    groupValue: prefs.user.gender,
                    onChanged: (gender) {
                      prefs.setUserGender(gender);
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
                      prefs.setUserVocation(vocation);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Vocation>(
                    title: Text('Married'),
                    value: Vocation.married,
                    groupValue: prefs.user.vocation,
                    onChanged: (vocation) {
                      prefs.setUserVocation(vocation);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Vocation>(
                    title: Text('Priest'),
                    value: Vocation.priest,
                    groupValue: prefs.user.vocation,
                    onChanged: (vocation) {
                      prefs.setUserVocation(vocation);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Vocation>(
                    title: Text('Religious'),
                    value: Vocation.religious,
                    groupValue: prefs.user.vocation,
                    onChanged: (vocation) {
                      prefs.setUserVocation(vocation);
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
    );
  }
}
