import 'package:flutter/material.dart';
import 'package:yuktidea/utils/common%20widgets/jr_svg_picture.dart';
import 'package:yuktidea/values/app_colors.dart';

class JrIconButton extends StatelessWidget {
  const JrIconButton({
    required this.assetName,
    this.onTap,
    this.margin,
    super.key,
  });

  final String assetName;
  final VoidCallback? onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Navigator.of(context).pop,
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10.5,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.white.withOpacity(0.3),
              offset: const Offset(-4, -3),
              blurRadius: 10,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.pureBlack.withOpacity(0.36),
              offset: const Offset(8, 5),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
          color: AppColors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(31),
          ),
        ),
        child: JRSvgPicture(
          assetName: assetName,
        ),
      ),
    );
  }
}
