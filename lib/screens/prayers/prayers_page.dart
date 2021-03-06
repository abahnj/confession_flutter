import 'package:confession_flutter/components/list_card.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/screens/prayers/prayer_detail_page.dart';
import 'package:confession_flutter/viewmodels/prayers_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PrayersPage extends StatelessWidget {
  static const String Id = '/prayersPage';

  static const String title = 'Prayers';

  static const String iconAsset = vectorRoot + 'ic_prayer.xml';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PrayersPage();
      case PrayersDetailPage.Id:
        return PrayersDetailPage(
          prayerId: settings.arguments,
        );
      case '/text':
        return null;
    }
  };

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrayersPageViewModel>.reactive(
      viewModelBuilder: () => PrayersPageViewModel(
        dao: Provider.of<AppDatabase>(context, listen: false).prayersDao,
      ),
      onModelReady: (model) {
        model.getAllPrayers();
      },
      staticChild: rootAppBar(context),
      builder: (context, model, child) => Scaffold(
        appBar: child,
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: model.prayers.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          // ignore: missing_return
          itemBuilder: (context, index) {
            final item = model.prayers[index];

            if (item is HeadingItem) {
              return ListTile(
                title: Center(
                  child: Text(
                    item.heading,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              );
            } else if (item is PrayerItem) {
              return ListCard(
                title: item.prayerName,
                onTap: () => {
                  Navigator.pushNamed(context, PrayersDetailPage.Id,
                      arguments: item.itemId)
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// The base class for the different types of items the list can contain.
abstract class ListItem {
  int itemId;
}

// A ListItem that contains data to display a heading.
class HeadingItem extends ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.
class PrayerItem extends ListItem {
  final String prayerName;
  final String prayerText;
  final String groupName;
  @override
  final int itemId;

  PrayerItem({this.prayerName, this.prayerText, this.groupName, this.itemId});
}
