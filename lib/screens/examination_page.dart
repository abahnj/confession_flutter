import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/viewmodels/examination_page_model.dart';
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
///

class ExaminationPage extends StatelessWidget {
  static const String Id = 'examinationPage';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ExaminationPageViewModel>.withConsumer(
      viewModel: ExaminationPageViewModel(
          Provider
              .of<AppDatabase>(context)
              .commandmentsDao),
      onModelReady: (model) => model.getAllCommandment(),
      builder: (context, model, _) =>
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: model.commandments.length,
              itemBuilder: (context, index) {
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
                      print('tapped index $index');
                    },
                    child: Container(
                      decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
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
                                  right:
                                  BorderSide(width: 1.0, color: Colors.white24),
                                ),
                              ),
                              child: Icon(Icons.autorenew, color: Colors.white),
                            ),
                          ],
                        ),
                        title: Text(
                          model.commandments[index].commandment,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
// subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(
                                Icons.linear_scale, color: Colors.yellowAccent),
                            Expanded(
                              child: Text(
                                  model.commandments[index].commandmentText,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
    );
  }
}
