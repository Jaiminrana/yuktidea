import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/common%20widgets/jr_scaffold.dart';
import 'package:yuktidea/utils/common%20widgets/jr_svg_picture.dart';
import 'package:yuktidea/utils/common%20widgets/jr_title_subtitle.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_constant.dart';
import 'package:yuktidea/values/app_strings.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({
    super.key,
    required this.country,
  });

  final CountryDataResDm country;

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  late final MaskTextInputFormatter maskFormatter;

  @override
  void initState() {
    super.initState();
    maskFormatter = MaskTextInputFormatter(
      mask: '${widget.country.telCode} ##########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  child: TextFormField(
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                     maxLength: 10,
                    cursorColor: AppColors.orange,
                    //inputFormatters: [maskFormatter],
                    // initialValue: '${widget.country.telCode} 9999999999',
                    decoration: InputDecoration(
                      counterText: AppStrings.kEmpty,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.grey,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.grey,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.orange,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                      prefixIcon: Padding(
                        padding:const EdgeInsets.fromLTRB(23, 17, 10, 17),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 23,
                              width: 35,
                              child: JRSvgPicture(
                                isSvgNetwork: true,
                                fit: BoxFit.fitWidth,
                                assetName: widget.country.flag!,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Text(
                              widget.country.telCode.toString(),
                              style: context.textTheme.displayMedium?.copyWith(
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
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: context.heightFraction(sizeFraction: 0.3),
                bottom: context.heightFraction(sizeFraction: 0.2),
              ),
              child: JrPrimaryButton(
                title: Str.current.getOTP,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
