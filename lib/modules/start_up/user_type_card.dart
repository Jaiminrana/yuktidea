import 'package:flutter/material.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';

class UserTypeCard extends StatelessWidget {
  const UserTypeCard({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
