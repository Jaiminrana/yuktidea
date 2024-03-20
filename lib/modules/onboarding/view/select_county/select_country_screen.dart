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

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<SelectCountryStore>();
    return Scaffold(
      body: SafeArea(
        child: ColoredBox(
          color: AppColors.backGround,
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
                height: 2,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  // gradient: LinearGradient(colors: [
                  //   AppColors.whitesBlack,
                  //   AppColors.blackishWhite,
                  // ]),
                ),
              ),
              const SizedBox(height: 25),
              Observer(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: store.countryState.isLoading
                      ? const CircularProgressIndicator()
                      : Wrap(
                          spacing: 35,
                          runSpacing: 54,
                          children: List.generate(
                            store.countryList.length,
                            (index) {
                              final country = store.countryList[index];

                              return SelectCountryCard(
                                title: country.name.toString(),
                                titleColor: AppColors.white,
                                imageColor: AppColors.grey,
                                imageUrl: country.image ?? '',
                              );
                            },
                          ),
                        ),
                );
              }),
              const SizedBox(height: 43),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.16),
                    offset: const Offset(6, 6),
                    blurRadius: 12,
                  ),
                  BoxShadow(
                    color: AppColors.white.withOpacity(0.16),
                    offset: const Offset(-20, -10),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ]),
                child: JrPrimaryButton(
                  titleColor: AppColors.lightOrange,
                  title: Str.current.proceed,
                  // color: AppColors.orange,
                  borderColor: AppColors.white.withOpacity(0.02),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 70,
                  ),
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
              // const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
