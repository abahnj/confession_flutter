import 'package:confession_flutter/components/confession_page_button.dart';
import 'package:confession_flutter/components/list_card.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/data/user.dart';
import 'package:confession_flutter/viewmodels/examination_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ConfessionPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExaminationPageViewModel>.reactive(
      createNewModelOnInsert: true,
      viewModelBuilder: () => ExaminationPageViewModel(
        dao: Provider.of<AppDatabase>(context).examinationsDao,
        user: Provider.of<User>(context),
      ),
      onModelReady: (model) => model.getActiveExaminations(),
      builder: (context, model, _) => Scaffold(
        body: Scaffold(
          appBar: rootAppBar(context),
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: model.activeExaminations.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: model.activeExaminations.length,
                          itemBuilder: (context, index) {
                            var examination = model.activeExaminations[index];
                            return ListCard(
                              title: examination.activeText,
                              trailing: Text(examination.count.toString()),
                            );
                          },
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'No data to display\n Please make an Examination of Conscience',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
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
                        onTap: () => Navigator.pop(context),
                        text: 'Previous',
                      ),
                      ConfessionPageButton(
                        onTap: () =>
                            Navigator.pushNamed(context, confessionPageThree),
                        text: 'Next',
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
