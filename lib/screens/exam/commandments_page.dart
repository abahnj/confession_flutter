import 'package:confession_flutter/components/list_card.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/screens/exam/examination.dart';
import 'package:confession_flutter/viewmodels/commandments_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

/// An interactive button within either material's [BottomNavigationBar]
/// or the iOS themed [CupertinoTabBar] with an icon and title.
///
/// This class is rarely used in isolation. It is typically embedded in one of
/// the bottom navigation widgets above.
///
/// See also:
///
///  * [BottomNavigationBar]
///  * <https://material.io/design/components/bottom-navigation.html>
///  * [CupertinoTabBar]
///  * <https://developer.apple.com/ios/human-interface-guidelines/bars/tab-bars>

//todo refactor to use user age

class CommandmentsPage extends StatelessWidget {
  static const String Id = 'commandmentsPage';

  static const String title = 'Exam';

  static const String iconAsset = vectorRoot + 'ic_exam.xml';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CommandmentsPage();
      case ExaminationPage.Id:
        int commandmentId = settings.arguments;
        return ExaminationPage(
          commandmentId: commandmentId,
        );
      case '/text':
        return null;
    }
  };
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommandmentsPageViewModel>.reactive(
      viewModelBuilder: () => CommandmentsPageViewModel(
        dao: Provider.of<AppDatabase>(context, listen: false).commandmentsDao,
        user: Provider.of<PrefsState>(context).user,
      ),
      staticChild: rootAppBar(),
      onModelReady: (model) => model.getAllCommandment(),
      builder: (context, model, child) {
        var commandments =
            model.filterCommandments(Provider.of<PrefsState>(context).user);
        return Scaffold(
          appBar: child,
          body: SafeArea(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: commandments.length,
              itemBuilder: (context, index) => ListCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ExaminationPage.Id,
                    arguments: commandments[index].id,
                  );
                },
                title: commandments[index].commandment,
                subtitle: commandments[index].commandmentText,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ExaminationArguments {
  final String title;
  final int commandmentId;

  ExaminationArguments(this.title, this.commandmentId);
}
