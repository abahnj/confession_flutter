import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConfessionPageButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const ConfessionPageButton({
    Key key,
    @required this.onTap,
    @required this.text,
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
      onPressed: onTap,
    );
  }
}
