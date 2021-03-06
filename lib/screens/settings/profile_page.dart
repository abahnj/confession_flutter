import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static const String Id = '/profilePage';

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsNotifier>(context, listen: false);
    var user = context.watch<User>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: CupertinoSettings(
        shrinkWrap: true,
        items: <Widget>[
          CSHeader('Gender'),
          CSSelection<Gender>(
            currentSelection: user.gender,
            onSelected: prefs.setUserGender,
            items: [
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
          CSHeader('Age'),
          CSSelection<Age>(
            currentSelection: user.age,
            onSelected: (age) => prefs.userAge = age,
            items: [
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
          CSHeader('Vocation'),
          CSSelection<Vocation>(
            currentSelection: user.vocation,
            onSelected: prefs.setUserVocation,
            items: [
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
