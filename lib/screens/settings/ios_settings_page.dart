import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/screens/settings/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../theme_prefs.dart';

class iOSSettingsPage extends StatelessWidget {
  const iOSSettingsPage({
    Key key,
    @required this.prefs,
  }) : super(key: key);

  final PrefsNotifier prefs;

  @override
  Widget build(BuildContext context) {
    return CupertinoSettings(
      items: <Widget>[
        CSHeader('APPEARANCE'),
        CSSelection<ThemeMode>(
          onSelected: (themeMode) {
            context.read<ThemeStyle>().userThemeMode = themeMode;
          },
          currentSelection: Provider.of<ThemeState>(context).userThemeMode,
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
          detail: context.watch<User>().toString(),
          cellType: CellType.detailRightStyle,
          onPressed: () => Navigator.of(context).pushNamed(ProfilePage.Id),
        ),
        CSLink(
          title: 'Date of Last Confession',
          detail: context.select((User user) {
            var myLocale = Localizations.localeOf(context);

            return DateFormat.yMMMEd(myLocale.toLanguageTag())
                .format(DateTime.parse(user.lastConfession));
          }),
          cellType: CellType.detailRightStyle,
          onPressed: () => showCupertinoModalPopup(
            context: context,
            useRootNavigator: false,
            builder: (context) => Container(
              height: 300,
              child: CupertinoDatePicker(
                backgroundColor: CupertinoColors.secondarySystemBackground,
                minimumYear: 2000,
                initialDateTime: DateTime.now(),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (date) => context
                    .read<PrefsNotifier>()
                    .lastConfession = date.toString(),
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          ),
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
            Share.share('Check this out', subject: 'Feedback');
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
    );
  }
}
