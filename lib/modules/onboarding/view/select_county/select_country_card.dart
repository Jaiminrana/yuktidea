import 'package:flutter/material.dart';
import 'package:yuktidea/utils/common%20widgets/jr_network_Image.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_constant.dart';

class SelectCountryCard extends StatelessWidget {
  const SelectCountryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.titleColor,
    this.onTap,
    this.isSelected = false,
  });

  final String imageUrl;
  final String title;
  final Color titleColor;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      child: Column(
        children: [
          JRNetworkImage(
            url: imageUrl,
            height: 80,
            width: 80,
            color: isSelected ? AppColors.transparent : AppColors.pureGrey,
            blendMode: isSelected ? BlendMode.multiply : BlendMode.saturation,
            borderRadius: const BorderRadius.all(AppConstant.roundedBorder10),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: isSelected ? AppColors.whiteFontColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
