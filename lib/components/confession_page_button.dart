import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConfessionPageButton extends StatelessWidget {
  final String destination;
  final String text;
  final bool previous;

  const ConfessionPageButton({
    Key key,
    @required this.destination,
    @required this.text,
    this.previous = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformButton(
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(fontSize: 24, color: Colors.red),
      ),
      onPressed: () {
        previous
            ? Navigator.of(context).pop()
            : Navigator.pushNamed(context, destination);
      },
    );
  }
}
