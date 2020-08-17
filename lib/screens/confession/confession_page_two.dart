import 'package:confession_flutter/components/confession_page_button.dart';
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
      viewModelBuilder: () => ExaminationPageViewModel(
        dao: Provider.of<AppDatabase>(context).examinationsDao,
        user: Provider.of<User>(context),
      ),
      onModelReady: (model) => model.getExaminationsForUserAndId(1),
      builder: (context, model, _) => Scaffold(
        body: Scaffold(
          appBar: rootAppBar(),
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: model.examinations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model.examinations[index].description),
                        subtitle:
                            Text(model.examinations[index].married.toString()),
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
