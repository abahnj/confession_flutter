import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/screens/guide/GuideListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class GuideListPage extends StatelessWidget {
  final int guideId;
  final String title;

  const GuideListPage({Key key, this.guideId, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(title: title),
      body: ViewModelBuilder<GuideListViewModel>.reactive(
        viewModelBuilder: () => GuideListViewModel(
          dao: Provider.of<AppDatabase>(context).guidesDao,
        ),
        onModelReady: (model) => model.getGuidesForId(guideId),
        builder: (context, model, _) => Scaffold(
          body: SafeArea(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: model.guides.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(model.guides[index].guideTitle),
                  onTap: () => {
                    Navigator.pushNamed(context, guideDetailPage,
                        arguments: model.guides[index].guideText)
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
