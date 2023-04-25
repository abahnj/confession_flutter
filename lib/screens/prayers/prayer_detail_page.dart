import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/screens/prayers/prayers_detail_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PrayersDetailPage extends StatelessWidget {
  static const String Id = '/prayersDetailPage';
  final int prayerId;

  const PrayersDetailPage({Key? key, required this.prayerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrayersDetailPageViewModel>.reactive(
      viewModelBuilder: () => PrayersDetailPageViewModel(
        dao: Provider.of<AppDatabase>(context).prayersDao,
      ),
      onViewModelReady: (model) => model.getPrayerForId(prayerId),
      builder: (context, model, _) => Scaffold(
        appBar: rootAppBar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    model.prayer?.prayerName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      model.prayer?.prayerText ?? '',
                      style: TextStyle(fontSize: 24.0),
                    ),
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
