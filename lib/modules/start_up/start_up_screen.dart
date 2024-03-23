import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/modules/start_up/user_type_card.dart';
import 'package:yuktidea/resources/resources.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_constant.dart';
import 'package:yuktidea/values/app_routes.dart';
import 'package:yuktidea/values/enumerations.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              image: AssetImage(
                Images.startup,
              ),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: AppColors.backGround,
                borderRadius: BorderRadius.only(
                  topRight: AppConstant.roundedBorder30,
                  topLeft: AppConstant.roundedBorder30,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    Str.current.startUpTitle,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    Str.current.startUpDes,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.whiteFontColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      UserTypeCard(
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.getCountryDataScreen,
                          arguments: UserType.student,
                        ),
                        title: Str.current.student,
                        image: Images.student,
                      ),
                      UserTypeCard(
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.getCountryDataScreen,
                          arguments: UserType.agent,
                        ),
                        title: Str.current.agent,
                        image: Images.agent,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Str.current.startUpFooter,
                          style: context.textTheme.displaySmall,
                        ),
                        TextSpan(
                          text: Str.current.termsNCondition,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                .pushNamed(AppRoutes.termsOfService),
                          style: context.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
