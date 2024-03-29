import 'dart:io';

import 'package:confession_flutter/components/list_card.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/viewmodels/examination_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

enum MenuOptions { edit, delete, decrement, resetCount }

enum CountValue { increment, decrement }

class ExaminationPage extends StatelessWidget {
  static const String Id = '/examinationPage';
  final int commandmentId;

  const ExaminationPage({Key? key, required this.commandmentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExaminationPageViewModel>.reactive(
      viewModelBuilder: () => ExaminationPageViewModel(
        dao: Provider.of<AppDatabase>(context).examinationsDao,
        user: Provider.of<User>(context),
      ),
      onViewModelReady: (model) {
        model.getExaminationsForUserAndId(commandmentId);
        model.setNeighbouringIds(commandmentId);
      },
      builder: (context, model, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    model.getCommandmentTitle(commandmentId),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: model.examinations.length,
                    itemBuilder: (context, index) {
                      var examination = model.examinations[index];
                      final overlay = Overlay.of(context)
                          .context
                          .findRenderObject() as RenderBox;

                      return ListCard(
                        onTap: () => model.updateCountForExamination(
                            index, CountValue.increment),
                        onLongPress: (details) async {
                          var selection = Platform.isIOS
                              ? await iOSDialog(context)
                              : await showAndroidMenu(
                                  context, overlay, details);
                          performMenuAction(selection!, model, index);
                        },
                        title: examination.description,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              examination.count.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


void performMenuAction(
    MenuOptions selection, ExaminationPageViewModel model, int index) {
  switch (selection) {
    case MenuOptions.edit:
      // TODO: Handle this case.
      break;
    case MenuOptions.delete:
      // TODO: Handle this case.
      break;
    case MenuOptions.decrement:
      model.updateCountForExamination(index, CountValue.decrement);
      break;
    case MenuOptions.resetCount:
      // TODO: Handle this case.
      break;
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
            onPressed: () {
              Navigator.pop(context, MenuOptions.decrement);
            },
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
          child: const Text('Cancel'),
        ),
      ),
    );

Future<MenuOptions?> showAndroidMenu(BuildContext context, RenderBox overlay,
        LongPressStartDetails details) async =>
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
          details.globalPosition & const Size(40, 40), // smaller rect, the touch area
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
