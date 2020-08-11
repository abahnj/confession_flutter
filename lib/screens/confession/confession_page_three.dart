import 'package:confession_flutter/components/confession_page_button.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConfessionPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    Text('Act of contrition'),
                    Text("''If the priest says "
                        "'Give thanks to teh Lord for he is Good' answer "
                        "'For his mercy endures forever'")
                  ],
                ),
              ),
            ),
            ConfessionPageButton(
              text: 'Finish',
              onTap: () => showDialog(
                context: context,
                useRootNavigator: false,
                builder: (context) => PlatformAlertDialog(
                  title: Text('abah'),
                  content: Text('Abah is awesome'),
                  actions: [
                    PlatformDialogAction(
                      child: PlatformText('FINISH'),
                      onPressed: () => Navigator.of(context)
                          .popUntil((route) => route.isFirst),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
