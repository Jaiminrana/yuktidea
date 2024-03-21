import 'package:flutter/material.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backGround,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Str.current.welcome,
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(height: 36),
          JrPrimaryButton(
            title: Str.current.logOut,
            titleColor: AppColors.lightOrange,
            onTap: Navigator.of(context).pop,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 70,
            ),
          ),
          const SizedBox(height: 36),
          JrPrimaryButton(
            title: Str.current.deleteUser,
            titleColor: AppColors.lightOrange,
            onTap: Navigator.of(context).pop,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 70,
            ),
          )
        ],
      ),
    );
  }
}
