import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/viewmodels/prayers_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class PrayersPage extends StatelessWidget {
  static const String Id = '/prayersPage';

  static const String title = 'Prayers';

  static const String iconAsset = vectorRoot + 'ic_prayer.xml';

  // ignore: missing_return
  static Function router = (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PrayersPage();
      case '/list':
        return null;
      case '/text':
        return null;
    }
  };

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PrayersPageViewModel>.withConsumer(
      viewModelBuilder: () => PrayersPageViewModel(
        dao: Provider.of<AppDatabase>(context).prayersDao,
      ),
      onModelReady: (model) {
        model.getAllPrayers();
      },
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          title: Text('Prayers'),
        ),
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
              return ListTile(
                title: Text(item.prayerName),
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
  int listId;
}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  int listId;
}

// A ListItem that contains data to display a message.
class PrayerItem implements ListItem {
  final String prayerName;
  final String prayerText;
  final String groupName;

  @override
  int listId;

  PrayerItem({this.prayerName, this.prayerText, this.groupName, this.listId});
}
