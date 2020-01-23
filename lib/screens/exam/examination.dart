import 'package:flutter/material.dart';

class ExaminationPage extends StatelessWidget {
  static const String Id = '/examinationPage';
  final int commandmentId;

  const ExaminationPage({Key key, this.commandmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          commandmentId.toString(),
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
