import 'package:flutter/material.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/modules/start_up/term_of_service_title_text.dart';
import 'package:yuktidea/resources/resources.dart';
import 'package:yuktidea/utils/common%20widgets/jr_icon_button.dart';
import 'package:yuktidea/utils/common%20widgets/jr_svg_picture.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = context.heightFraction(sizeFraction: 0.03);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: JrIconButton(
                  assetName: Vectors.close,
                  margin: EdgeInsets.only(
                    top: padding,
                    right: padding,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const JRSvgPicture(assetName: Vectors.termsService),
                    const SizedBox(width: 25),
                    Column(
                      children: [
                        Text(
                          Str.current.termsOfService,
                          style: context.textTheme.displayMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          Str.current.updatedTermsDate,
                          style: context.textTheme.bodySmall
                              ?.copyWith(color: AppColors.greyFontColor),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              TermOfServiceTitleText(
                title: Str.current.privacyPolicy,
                description: Str.current.privacyPolicyDes,
              ),
              const SizedBox(height: 30),
              TermOfServiceTitleText(
                title: Str.current.consent,
                description: Str.current.consentDes,
              ),
              const SizedBox(height: 30),
              TermOfServiceTitleText(
                title: Str.current.informationWeCollect,
                description: Str.current.informationWeCollectDes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
