import 'package:flutter/material.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_routes.dart';

class SelectCountryFooter extends StatelessWidget {
  const SelectCountryFooter({
    this.isEnable = false,
    this.onTap,
    super.key,
  });

  final bool isEnable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 43),
        JrPrimaryButton(
          isEnable: isEnable,
          title: Str.current.proceed,
          onTap: () {
            isEnable ? onTap?.call() : null;
          },
          borderColor: AppColors.white.withOpacity(0.02),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 70,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          Str.current.cantSeeCountry,
          style: context.textTheme.displaySmall,
        ),
        const SizedBox(height: 15),
        Text(
          Str.current.consultWithUs,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.orange),
        ),
        SizedBox(height: context.heightFraction(sizeFraction: 0.04)),
      ],
    );
  }
}
