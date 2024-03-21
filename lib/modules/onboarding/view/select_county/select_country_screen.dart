import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/modules/onboarding/store/select_country_store.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_card.dart';
import 'package:yuktidea/resources/resources.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/common%20widgets/jr_svg_picture.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yuktidea/values/app_routes.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<SelectCountryStore>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(
                  top: context.heightFraction(sizeFraction: 0.03),
                  left: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10.5,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.3),
                      offset: const Offset(-4, -3),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: AppColors.pureBlack.withOpacity(0.36),
                      offset: const Offset(8, 5),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                  color: AppColors.black,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(31),
                  ),
                ),
                child: const JRSvgPicture(
                  assetName: Vectors.arrowBack,
                ),
              ),
            ),
            const SizedBox(height: 19),
            Text(
              Str.current.selectCountry,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 19),
            Text(
              Str.current.selectCountryDes,
              style: context.textTheme.bodySmall?.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 27),
            Container(
              width: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.white0,
                  AppColors.fullBlack,
                  AppColors.white0,
                ]),
              ),
            ),
            Container(
              height: 12,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.black20, width: 2),
                ),

                // // GradientBoxBorder(
                // //   width: 1,
                // //   gradient: LinearGradient(
                // //     colors: [
                //       AppColors.blackishWhite,
                //       AppColors.whitesBlack,
                //       AppColors.blackishWhite,
                // //     ],
                // //   ),
                // // ),
                color: Colors.black,
                gradient: LinearGradient(colors: [
                  AppColors.linearBlack0,
                  AppColors.black20,
                ]),
              ),
              child: Container(
                width: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.white0,
                    AppColors.fullBlack,
                    AppColors.white0,
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Observer(builder: (context) {
                    return store.countryState.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Wrap(
                            spacing: 35,
                            runSpacing: 54,
                            children: List.generate(
                              6, //store.countryList.length,
                              (index) {
                                final country = store.countryList[1];

                                return SelectCountryCard(
                                  title: country.name.toString(),
                                  titleColor: AppColors.white,
                                  imageColor: AppColors.grey,
                                  imageUrl: country.image ?? '',
                                );
                              },
                            ),
                          );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 43),
            JrPrimaryButton(
              titleColor: AppColors.lightOrange,
              title: Str.current.proceed,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.welcomeScreen),
              // color: AppColors.orange,
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
              style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.orange),
            ),
            SizedBox(height: context.heightFraction(sizeFraction: 0.04)),
          ],
        ),
      ),
    );
  }
}
