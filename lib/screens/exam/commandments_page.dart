import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/screens/exam/examination.dart';
import 'package:confession_flutter/viewmodels/commandments_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/avd.dart';
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
///

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
    return ViewModelProvider<CommandmentsPageViewModel>.withConsumer(
      viewModel: CommandmentsPageViewModel(
        Provider.of<AppDatabase>(context).commandmentsDao,
      ),
      onModelReady: (model) => model.getAllCommandment(),
      staticChild: rootAppBar(context),
      builder: (context, model, child) => Scaffold(
        appBar: child,
        body: SafeArea(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: model.commandments.length,
            itemBuilder: (context, index) {
              return _buildCard(context, index, model);
            },
          ),
        ),
      ),
    );
  }
}

Card _buildCard(
    BuildContext context, int index, CommandmentsPageViewModel model) {
  return Card(
    elevation: 8.0,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: InkWell(
      highlightColor: Colors.red,
      splashColor: Colors.green,
      onTap: () {
        print('$index');
        Navigator.pushNamed(context, ExaminationPage.Id,
            arguments: model.commandments[index].id);
      },
      child: Container(
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24),
                  ),
                ),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: AvdPicture.asset(
                    'assets/vectors/ic_cross.xml',
                    color: iconColorActive,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            model.commandments[index].commandment,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: model.commandments[index].commandmentText.isNotEmpty
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        model.commandments[index].commandmentText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              : null,
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
        ),
      ),
    ),
  );
}
