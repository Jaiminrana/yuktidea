import 'package:flutter/material.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/resources/resources.dart';
import 'package:yuktidea/utils/common%20widgets/jr_icon_button.dart';
import 'package:yuktidea/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_routes.dart';

class SelectCountryHeader extends StatelessWidget {
  const SelectCountryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: JrIconButton(
            assetName: Vectors.arrowBack,
            margin: EdgeInsets.only(
              top: context.heightFraction(sizeFraction: 0.03),
              left: 30,
            ),
          ),
        ),
        const SizedBox(height: 19),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.welcomeScreen);
          },
          child: Text(
            Str.current.selectCountry,
            style: context.textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 19),
        Text(
          Str.current.selectCountryDes,
          style: context.textTheme.bodySmall?.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 27),
        const JrOpaqueDivider(),
        const SizedBox(height: 25),
      ],
    );
  }
}
