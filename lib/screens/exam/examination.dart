import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
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
          Provider.of<AppDatabase>(context).examinationsDao,
        ),
        onModelReady: (model) => model.getExaminationsForId(commandmentId),
        builder: (context, model, child) => Scaffold(
          appBar: child,
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
