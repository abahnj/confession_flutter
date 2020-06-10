import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/screens/exam/examination.dart';
import 'package:confession_flutter/screens/exam/list_card.dart';
import 'package:confession_flutter/viewmodels/commandments_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

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
        var commandmentId = settings.arguments;
        return ExaminationPage(
          commandmentId: commandmentId,
        );
      case '/text':
        return null;
    }
  };
  @override
  Widget build(BuildContext context) {
    print('build called');
    return ViewModelProvider<CommandmentsPageViewModel>.withConsumer(
      viewModelBuilder: () => CommandmentsPageViewModel(
        dao: Provider.of<AppDatabase>(context).commandmentsDao,
        user: Provider.of<User>(context),
      ),
      onModelReady: (model) => model.getAllCommandment(),
      staticChild: rootAppBar(context),
      builder: (context, model, child) {
        return Scaffold(
          appBar: child,
          body: SafeArea(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: model.commandments.length,
              itemBuilder: (context, index) {
                return ListCard(
                  onTap: () {
                    Navigator.pushNamed(context, ExaminationPage.Id,
                        arguments: model.commandments[index].id);
                  },
                  title: model.commandments[index].commandment,
                  subtitle: model.commandments[index].commandmentText,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
