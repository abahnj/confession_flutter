import 'package:confession_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ExaminationPage extends StatelessWidget {
  static const String Id = '/examinationPage';
  final int commandmentId;

  const ExaminationPage({Key key, this.commandmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PlatformText(kAppName),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(
              commandmentId.toString(),
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
