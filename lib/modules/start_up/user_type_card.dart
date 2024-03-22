import 'package:flutter/material.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';

class UserTypeCard extends StatelessWidget {
  const UserTypeCard({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Image.asset(image),
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.whiteFontColor,
            fontWeight: FontWeight.w600,
          ),

        ),
      ],
    );
  }
}
