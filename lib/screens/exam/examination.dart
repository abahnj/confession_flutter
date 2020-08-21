import 'dart:io';

import 'package:confession_flutter/components/confession_page_button.dart';
import 'package:confession_flutter/components/list_card.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/viewmodels/examination_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

enum MenuOptions { edit, delete, decrement, resetCount }

class ExaminationPage extends StatelessWidget {
  static const String Id = '/examinationPage';
  final int commandmentId;

  const ExaminationPage({Key key, this.commandmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(),
      body: SafeArea(
        child: ViewModelBuilder<ExaminationPageViewModel>.reactive(
          createNewModelOnInsert: true,
          viewModelBuilder: () => ExaminationPageViewModel(
            dao: Provider.of<AppDatabase>(context).examinationsDao,
            user: Provider.of<User>(context),
          ),
          onModelReady: (model) {
            model.getExaminationsForUserAndId(commandmentId);
            model.setNeighbouringIds(commandmentId);
          },
          disposeViewModel: false,
          builder: (context, model, _) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: Text(
                        model.getCommandmentTitle(commandmentId),
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: model.examinations.length,
                        itemBuilder: (context, index) {
                          var examination = model.examinations[index];
                          final RenderBox overlay =
                              Overlay.of(context).context.findRenderObject();

                          return ListCard(
                            onTap: () => model.updateCountForExamination(
                              examination.copyWith(
                                count: examination.count + 1,
                              ),
                            ),
                            onLongPress: (details) async {
                              var selection = Platform.isIOS
                                  ? await iOSDialog(context)
                                  : await showAndroidMenu(
                                      context, overlay, details);
                            },
                            title: examination.description,
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  examination.count.toString(),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ConfessionPageButton(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, ExaminationPage.Id,
                                arguments: model.previousCommandmentId),
                            text: 'Previous',
                          ),
                          ConfessionPageButton(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, ExaminationPage.Id,
                                arguments: model.nextCommandmentId),
                            text: 'Next',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

const Text decrementText = Text('Count - 1');
const Text editText = Text('Edit');
const Text deleteText = Text('Delete');
const Text resetText = Text('Reset');

Future<MenuOptions> iOSDialog(BuildContext context) async =>
    await showCupertinoModalPopup(
      useRootNavigator: false,
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context, MenuOptions.decrement),
            child: decrementText,
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context, MenuOptions.edit),
            child: editText,
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context, MenuOptions.delete),
            child: deleteText,
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context, MenuOptions.resetCount),
            child: resetText,
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
      ),
    );

Future<MenuOptions> showAndroidMenu(BuildContext context, RenderBox overlay,
        LongPressStartDetails details) async =>
    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          details.globalPosition & Size(40, 40), // smaller rect, the touch area
          Offset.zero & overlay.size // Bigger rect, the entire screen
          ),
      items: <PopupMenuEntry<MenuOptions>>[
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.decrement,
          child: decrementText,
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.edit,
          child: editText,
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.delete,
          child: deleteText,
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.resetCount,
          child: resetText,
        ),
      ],
    );
