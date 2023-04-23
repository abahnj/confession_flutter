import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:flutter/material.dart';

class GuideDetailPage extends StatelessWidget {
  final String guideText;

  const GuideDetailPage({Key? key, required this.guideText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(context),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              guideText,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
