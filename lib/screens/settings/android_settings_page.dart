import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/theme_prefs.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AndroidSettingsPage extends StatelessWidget {
  const AndroidSettingsPage({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final PrefsNotifier prefs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16),
          child: Text(
            'Appearance',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'Theme',
          ),
          subtitle: Text(
            Utils.getEnumTitle(
              context.select(
                (ThemeState value) => value.userThemeMode.toString(),
              ),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => SimpleDialog(
                title: const Center(
                  child: Text(
                    'Gender',
                  ),
                ),
                children: <Widget>[
                  RadioListTile<ThemeMode>(
                    title: const Text('System'),
                    value: ThemeMode.system,
                    groupValue: context.watch<ThemeState>().userThemeMode,
                    onChanged: (gender) {
                      context.read<ThemeStyle>().userThemeMode =
                          ThemeMode.system;
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Dark'),
                    value: ThemeMode.dark,
                    groupValue: context.watch<ThemeState>().userThemeMode,
                    onChanged: (gender) {
                      context.read<ThemeStyle>().userThemeMode = ThemeMode.dark;
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Light'),
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
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16),
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'Gender',
          ),
          subtitle: Text(
            Utils.getEnumTitle(
              context.select(
                (User value) => value.gender.toString(),
              ),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => SimpleDialog(
                title: const Center(
                  child: Text(
                    'Gender',
                  ),
                ),
                children: <Widget>[
                  RadioListTile<Gender>(
                    title: const Text('Male'),
                    value: Gender.male,
                    groupValue: prefs.user.gender,
                    onChanged: (gender) {
                      prefs.setUserGender(gender!);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Gender>(
                    title: const Text('Female'),
                    value: Gender.female,
                    groupValue: prefs.user.gender,
                    onChanged: (gender) {
                      prefs.setUserGender(gender!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        ListTile(
          title: const Text(
            'Age',
          ),
          subtitle: Text(
            Utils.getEnumTitle(
              context.select(
                (User value) => value.age.toString(),
              ),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => SimpleDialog(
                title: const Center(
                  child: Text(
                    'Age',
                  ),
                ),
                children: <Widget>[
                  RadioListTile<Age>(
                    title: const Text('Adult'),
                    value: Age.adult,
                    groupValue: prefs.user.age,
                    onChanged: (age) {
                      prefs.userAge = age!;
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Age>(
                    title: const Text('Teen'),
                    value: Age.teen,
                    groupValue: prefs.user.age,
                    onChanged: (age) {
                      prefs.userAge = age!;
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Age>(
                    title: const Text('Child'),
                    value: Age.child,
                    groupValue: prefs.user.age,
                    onChanged: (age) {
                      prefs.userAge = age!;
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          },
        ),
        ListTile(
          title: const Text(
            'Vocation',
          ),
          subtitle: Text(
            Utils.getEnumTitle(
              context.select(
                (User value) => value.vocation.toString(),
              ),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => SimpleDialog(
                title: const Center(
                  child: Text(
                    'Vocation',
                  ),
                ),
                children: <Widget>[
                  RadioListTile<Vocation>(
                    title: const Text('Single'),
                    value: Vocation.single,
                    groupValue: prefs.user.vocation,
                    onChanged: (vocation) {
                      prefs.setUserVocation(vocation!);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Vocation>(
                    title: const Text('Married'),
                    value: Vocation.married,
                    groupValue: prefs.user.vocation,
                    onChanged: (vocation) {
                      prefs.setUserVocation(vocation!);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Vocation>(
                    title: const Text('Priest'),
                    value: Vocation.priest,
                    groupValue: prefs.user.vocation,
                    onChanged: (vocation) {
                      prefs.setUserVocation(vocation!);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<Vocation>(
                    title: const Text('Religious'),
                    value: Vocation.religious,
                    groupValue: prefs.user.vocation,
                    onChanged: (vocation) {
                      prefs.setUserVocation(vocation!);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          },
        ),
        ListTile(
          title: const Text(
            'Date of Last Confession',
          ),
          subtitle: Text(
            context.select(
              (User user) => getDateString(context, user.lastConfession),
            ),
          ),
          onTap: () async {
            var date = await showDatePicker(
                context: context,
                useRootNavigator: false,
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime.now());

            if (date != null) prefs.lastConfession = date.toString();
          },
        ),
        const Divider(
          thickness: 2,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16),
          child: Text(
            'Reset App',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.restore),
          title: const Text(
            'Reset App',
          ),
          subtitle: const Text(
            'WARNING! This will delete all personal application data including added examinations',
          ),
          onTap: () {
            /*return showDialog<void>(
            useRootNavigator: false,
            context: context,
            barrierDismissible:
                true, // false = user must tap button, true = tap outside dialog
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text('title'),
                content: Text('dialogBody'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('buttonText'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );*/
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16),
          child: Text(
            'Help',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.feedback),
          title: const Text(
            'Send Feedback',
          ),
          subtitle: const Text(
            'Report technical issues or suggest new features',
          ),
          onTap: () {
            sendFeedbackEmail();
          },
        ),
      ],
    );
  }
}
