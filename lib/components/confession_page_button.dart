import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConfessionPageButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const ConfessionPageButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      child: PlatformText(
        text,
        style:
            Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.red),
      ),
      onPressed: onTap,
    );
  }
}
