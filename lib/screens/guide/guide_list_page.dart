import 'package:confession_flutter/components/list_card.dart';
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

  const GuideListPage({Key? key, required this.guideId, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(context, title: 'Guide'),
      body: ViewModelBuilder<GuideListViewModel>.reactive(
        viewModelBuilder: () => GuideListViewModel(
          dao: Provider.of<AppDatabase>(context).guidesDao,
          user: null,
        ),
        onViewModelReady: (model) => model.getGuidesForId(guideId),
        builder: (context, model, _) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: model.guides.length,
                    itemBuilder: (context, index) {
                      return ListCard(
                        title: model.guides[index].guideTitle,
                        onTap: () => {
                          Navigator.pushNamed(context, guideDetailPage,
                              arguments: model.guides[index].guideText)
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
