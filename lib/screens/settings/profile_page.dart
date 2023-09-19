import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const String Id = '/profilePage';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsNotifier>(context, listen: false);
    var user = context.watch<User>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: CupertinoSettings(
        shrinkWrap: true,
        items: <Widget>[
          const CSHeader('Gender'),
          CSSelection<Gender>(
            currentSelection: user.gender,
            onSelected: prefs.setUserGender,
            items: const [
              CSSelectionItem(
                value: Gender.male,
                text: 'Male',
              ),
              CSSelectionItem(
                value: Gender.female,
                text: 'Female',
              ),
            ],
          ),
          const CSHeader('Age'),
          CSSelection<Age>(
            currentSelection: user.age,
            onSelected: (age) => prefs.userAge = age,
            items: const [
              CSSelectionItem(
                value: Age.adult,
                text: 'Adult',
              ),
              CSSelectionItem(
                value: Age.teen,
                text: 'Teen',
              ),
              CSSelectionItem(
                value: Age.child,
                text: 'Child',
              ),
            ],
          ),
          const CSHeader('Vocation'),
          CSSelection<Vocation>(
            currentSelection: user.vocation,
            onSelected: prefs.setUserVocation,
            items: const [
              CSSelectionItem(
                value: Vocation.single,
                text: 'Single',
              ),
              CSSelectionItem(
                value: Vocation.married,
                text: 'Married',
              ),
              CSSelectionItem(
                value: Vocation.priest,
                text: 'Priest',
              ),
              CSSelectionItem(
                value: Vocation.religious,
                text: 'Religious',
              )
            ],
          ),
        ],
      ),
    );
  }
}
