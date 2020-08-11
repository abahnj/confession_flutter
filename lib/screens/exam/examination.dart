import 'package:confession_flutter/components/confession_page_button.dart';
import 'package:confession_flutter/components/list_card.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/viewmodels/examination_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ExaminationPage extends StatelessWidget {
  static const String Id = '/examinationPage';
  final int commandmentId;

  const ExaminationPage({Key key, this.commandmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(),
      body: ViewModelBuilder<ExaminationPageViewModel>.reactive(
        viewModelBuilder: () => ExaminationPageViewModel(
          dao: Provider.of<AppDatabase>(context).examinationsDao,
          user: Provider.of<PrefsState>(context).user,
        ),
        onModelReady: (model) {
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
                        return ListCard(
                          onTap: () => null,
                          title: model.examinations[index].description,
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0',
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
    );
  }
}
