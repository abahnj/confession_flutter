import 'package:confession_flutter/components/confession_page_button.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/screens/prayers/prayers_detail_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ConfessionPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrayersDetailPageViewModel>.reactive(
      viewModelBuilder: () => PrayersDetailPageViewModel(
        dao: context.read<AppDatabase>().prayersDao,
      ),
      onModelReady: (model) {
        model.getPrayerForId(2);
        model.getRandomInspiration();
      },
      builder: (context, model, _) => Scaffold(
        appBar: rootAppBar(context),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
            child: Column(
              children: [
                Text(
                  'Act of Contrition',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            model.prayer?.prayerText ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        TextSpan(
                          text: 'If the priest says ',
                        ),
                        TextSpan(
                          text: '"Give thanks to the Lord for he is Good" ',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text: 'answer ',
                        ),
                        TextSpan(
                          text: '"For his mercy endures forever"',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                        ),
                      ]),
                  textAlign: TextAlign.start,
                ),
                ConfessionPageButton(
                  text: 'Finish',
                  onTap: () => showDialog(
                    context: context,
                    useRootNavigator: false,
                    builder: (context) => PlatformAlertDialog(
                      title: Text(model.randomInspiration.author),
                      content: Text(model.randomInspiration.quote),
                      actions: [
                        PlatformDialogAction(
                          child: PlatformText('FINISH'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            return null;
                          },
                        )
                      ],
                    ),
                  ).then(
                    (value) {
                      model.finishConfession();
                      Navigator.of(context).popUntil((route) => route.isFirst);
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
