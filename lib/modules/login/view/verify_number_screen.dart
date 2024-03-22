import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/common%20widgets/jr_scaffold.dart';
import 'package:yuktidea/utils/common%20widgets/jr_title_subtitle.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return JrScaffold(
      child: Column(
        children: [
          JrTitleSubtitle(
            title: Str.current.verifyNumber,
            subTitle: Str.current.verifyNumberDes,
          ),
          const SizedBox(height: 27),
          const JrOpaqueDivider(),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: OtpTextField(
              numberOfFields: 6,

              enabledBorderColor: AppColors.grey,
              focusedBorderColor: AppColors.orange,
              cursorColor: Colors.white,

              //set to true to show as box or false to show as dash
              showFieldAsBox: false,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
          ),
          SizedBox(
            height: context.heightFraction(sizeFraction: 0.11),
          ),
          Text(
            Str.current.didNotReceiveOTP,
            style: textTheme.bodySmall?.copyWith(color: AppColors.grey),
          ),
          const SizedBox(height: 25),
          Text(
            Str.current.resendOTP,
            style: textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.heightFraction(sizeFraction: 0.1),
              bottom: context.heightFraction(sizeFraction: 0.2),
            ),
            child: JrPrimaryButton(title: Str.current.verify),
          ),
        ],
      ),
    );
  }
}
