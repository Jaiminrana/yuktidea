import 'package:flutter/material.dart';
import 'package:yuktidea/values/app_colors.dart';

class JrOpaqueDivider extends StatelessWidget {
  const JrOpaqueDivider({
    super.key,
    this.margin,
  });

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.white0,
            AppColors.fullBlack,
            AppColors.white0,
          ],
        ),
      ),
    );
  }
}
