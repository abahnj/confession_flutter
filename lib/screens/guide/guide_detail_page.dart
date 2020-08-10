import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:flutter/material.dart';

class GuideDetailPage extends StatelessWidget {
  final String guideText;

  const GuideDetailPage({Key key, this.guideText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Text(
          guideText,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
