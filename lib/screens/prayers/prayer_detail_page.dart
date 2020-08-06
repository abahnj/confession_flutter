import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/screens/prayers/prayers_detail_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PrayersDetailPage extends StatelessWidget {
  static const String Id = '/prayersDetailPage';
  final int prayerId;

  const PrayersDetailPage({Key key, this.prayerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrayersDetailPageViewModel>.reactive(
      viewModelBuilder: () => PrayersDetailPageViewModel(
        dao: Provider.of<AppDatabase>(context).prayersDao,
      ),
      onModelReady: (model) => model.getPrayerForId(prayerId),
      builder: (context, model, _) => Scaffold(
        body: Scaffold(
          appBar: AppBar(
            title: Text(model.prayer.prayerName),
          ),
          body: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(40.0),
              child: Center(
                child: Text(
                  model.prayer.prayerText,
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
