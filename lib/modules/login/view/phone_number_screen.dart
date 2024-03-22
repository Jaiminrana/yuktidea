import 'package:flutter/material.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:yuktidea/utils/common%20widgets/jr_scaffold.dart';
import 'package:yuktidea/utils/common%20widgets/jr_svg_picture.dart';
import 'package:yuktidea/utils/common%20widgets/jr_title_subtitle.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_constant.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({
    super.key,
    required this.country,
  });

  final CountryDataResDm country;

  @override
  Widget build(BuildContext context) {
    return JrScaffold(
        child: Column(
      children: [
        const SizedBox(height: 19),
        JrTitleSubtitle(
          title: Str.current.enterPhoneNumber,
          subTitle: Str.current.enterPhoneNumberDes,
        ),
        const SizedBox(height: 27),
        const JrOpaqueDivider(),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 11.5,
              horizontal: 15,
            ),
            prefixIcon: SizedBox(
              height: 22,
              width: 34,
              child: JRSvgPicture(
                isSvgNetwork: true,
                fit: BoxFit.cover,
                assetName: country.flag!,
              ),
            ),
            hintText: Str.current.search,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.whiteFontColor,
            ),
          ),
        ),
      ],
    ));
  }
}
