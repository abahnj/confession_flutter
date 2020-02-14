import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/prefs.dart';
import 'package:confession_flutter/viewmodels/examination_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ExaminationPage extends StatelessWidget {
  static const String Id = '/examinationPage';
  final int commandmentId;

  const ExaminationPage({Key key, this.commandmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PlatformText(kAppName),
      ),
      body: ViewModelProvider<ExaminationPageViewModel>.withConsumer(
        viewModel: ExaminationPageViewModel(
          dao: Provider.of<AppDatabase>(context).examinationsDao,
          user: Provider.of<PrefsNotifier>(context).user,
        ),
        onModelReady: (model) =>
            model.getExaminationsForUserAndId(commandmentId),
        builder: (context, model, _) =>
            Scaffold(
          body: SafeArea(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: model.examinations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(model.examinations[index].description),
                  subtitle: Text(model.examinations[index].married.toString()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
