import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuktidea/modules/onboarding/store/select_country_store.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_card.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_footer.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_header.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yuktidea/values/app_routes.dart';
import 'package:yuktidea/values/app_strings.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<SelectCountryStore>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            const SelectCountryHeader(),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Observer(
                    builder: (context) {
                      return store.countryState.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Wrap(
                              spacing: 35,
                              runSpacing: 54,
                              children: List.generate(
                                store.countryList.length,
                                (index) {
                                  final country = store.countryList[index];
                                  return Observer(
                                    builder: (context) {
                                      return SelectCountryCard(
                                        onTap: () =>
                                            store.onSelectCountryTap(index),
                                        isSelected:
                                            store.selectedCountry == index,
                                        title: country.name.toString(),
                                        titleColor: AppColors.white,
                                        imageUrl:
                                            country.image ?? AppStrings.kEmpty,
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                    },
                  ),
                ),
              ),
            ),
            Observer(
              builder: (context) {
                return SelectCountryFooter(
                  isEnable: store.selectedCountry != -1,
                  onTap: () async {
                    final result = await store.setSelectedCountryForStudy();
                    if (result.isNotNullOrEmpty &&
                        result?.trim() == AppStrings.countrySelectedSuccess &&
                        context.mounted) {
                      Navigator.of(context).pushNamed(AppRoutes.welcomeScreen);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
