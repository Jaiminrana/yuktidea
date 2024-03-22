import 'package:flutter/material.dart';
import 'package:yuktidea/utils/extensions.dart';

class JrTitleSubtitle extends StatelessWidget {
  const JrTitleSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      children: [
        Text(
          title,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Text(
          subTitle,
          style: textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
