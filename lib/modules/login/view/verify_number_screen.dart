import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/modules/login/store/verify_number_store.dart';
import 'package:yuktidea/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/common%20widgets/jr_scaffold.dart';
import 'package:yuktidea/utils/common%20widgets/jr_title_subtitle.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_routes.dart';

class VerifyNumberScreen extends StatelessObserverWidget {
  const VerifyNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final store = context.read<VerifyNumberStore>();
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
              autoFocus: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              styles: [
                context.textTheme.displayMedium,
                context.textTheme.displayMedium,
                context.textTheme.displayMedium,
                context.textTheme.displayMedium,
              ],
              numberOfFields: 4,
              enabledBorderColor: AppColors.grey,
              focusedBorderColor: AppColors.orange,
              cursorColor: Colors.white,
              showFieldAsBox: false,
              onCodeChanged: store.trackOtpLength,
              onSubmit: (value) {
                store.otpCode = value;
              },
            ),
          ),
          if (!store.isValidOtp)
            Text(
              Str.current.verifyNumberError,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.red,
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
          GestureDetector(
            onTap: () {
              store.resendCount != 10 ? null : store.resendOtpTimer();
            },
            child: Text(
              store.resendCount != 10
                  ? Str.current.resendOtpInSeconds(store.resendCount)
                  : Str.current.resendOTP,
              style: textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.heightFraction(sizeFraction: 0.1),
              bottom: context.heightFraction(sizeFraction: 0.1),
            ),
            child: Observer(builder: (context) {
              return JrPrimaryButton(
                  loading: store.verifyState.isLoading,
                  title: Str.current.verify,
                  onTap: () async {
                    final result = await store.verifyOtp();
                    if (result && context.mounted) {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.selectCountryScreen);
                    }
                  });
            }),
          ),
        ],
      ),
    );
  }
}
