import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/model/login/otp_req_dm.dart';
import 'package:yuktidea/modules/login/store/enter_phone_number_store.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/common%20widgets/jr_scaffold.dart';
import 'package:yuktidea/utils/common%20widgets/jr_svg_picture.dart';
import 'package:yuktidea/utils/common%20widgets/jr_title_subtitle.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/utils/typedefs.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_routes.dart';
import 'package:yuktidea/values/app_strings.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  const EnterPhoneNumberScreen({
    super.key,
    required this.country,
  });

  final CountryDataResDm country;

  final border = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.grey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final store = context.read<EnterPhoneNumberStore>();
    return JrScaffold(
      child: Expanded(
        child: Column(
          children: [
            const SizedBox(height: 19),
            JrTitleSubtitle(
              title: Str.current.enterPhoneNumber,
              subTitle: Str.current.enterPhoneNumberDes,
            ),
            const SizedBox(height: 27),
            const JrOpaqueDivider(),
            const SizedBox(height: 48),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Observer(builder: (context) {
                    return TextFormField(
                      controller: store.phoneNumberController,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      cursorColor: AppColors.orange,
                      decoration: InputDecoration(
                        counterText: AppStrings.kEmpty,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border.copyWith(
                          borderSide: const BorderSide(
                            color: AppColors.orange,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 17),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(23, 17, 10, 17),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 23,
                                width: 35,
                                child: JRSvgPicture(
                                  isSvgNetwork: true,
                                  fit: BoxFit.fitWidth,
                                  assetName: country.flag!,
                                ),
                              ),
                              const SizedBox(width: 25),
                              Text(
                                country.telCode.toString(),
                                style:
                                    context.textTheme.displayMedium?.copyWith(
                                  color: AppColors.whiteFontColor,
                                ),
                              ),
                              // const SizedBox(width: 10),
                            ],
                          ),
                        ),
                        hintText: AppStrings.enterPhoneHint,
                        hintStyle: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.slateGrey,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: context.heightFraction(sizeFraction: 0.3),
                bottom: context.heightFraction(sizeFraction: 0.2),
              ),
              child: Observer(builder: (context) {
                return JrPrimaryButton(
                  loading: store.countryState.isLoading,
                  title: Str.current.getOTP,
                  onTap: () async {
                    final phoneNo = store.phoneNumberController.text.trim();
                    final countryCode = country.telCode.toString();
                    if (countryCode.isNullOrEmpty || phoneNo.isNullOrEmpty) {
                      SnackBarService.showSnack(Str.current.validNumberPlease);

                      return;
                    }
                    final result = await store.getOtp(
                      OtpReqDm(
                        telCode: countryCode,
                        phone: phoneNo,
                      ),
                    );
                    if (result && context.mounted) {
                      final PhoneNavDm phoneNavDm = (
                        country: country,
                        userType: store.userType,
                        phoneNumber: store.phoneNumberController.text.trim(),
                      );
                      Navigator.of(context).pushNamed(
                        AppRoutes.verifyPhoneNumberScreen,
                        arguments: phoneNavDm,
                      );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
