import 'package:flutter/material.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';

class TermOfServiceTitleText extends StatelessWidget {
  const TermOfServiceTitleText({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.orange,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: context.textTheme.displaySmall,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
