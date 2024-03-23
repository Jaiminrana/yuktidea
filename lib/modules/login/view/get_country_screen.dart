import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/modules/login/store/get_country_store.dart';
import 'package:yuktidea/resources/resources.dart';
import 'package:yuktidea/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:yuktidea/utils/common%20widgets/jr_svg_picture.dart';
import 'package:yuktidea/utils/extensions.dart';

import 'package:yuktidea/utils/common%20widgets/jr_scaffold.dart';
import 'package:yuktidea/utils/typedefs.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_constant.dart';
import 'package:yuktidea/values/app_routes.dart';
import 'package:yuktidea/values/enumerations.dart';

class GetCountryScreen extends StatelessObserverWidget {
  const GetCountryScreen({
    required this.userType,
    super.key,
  });

  final UserType userType;

  @override
  Widget build(BuildContext context) {
    final store = context.read<GetCountryStore>();
    print(store.search);
    return JrScaffold(
      child: Expanded(
        child: Column(
          children: [
            Text(
              Str.current.selectYourCountry,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.whiteFontColor,
                  ),
                  controller: store.searchController,
                  cursorColor: AppColors.orange,
                  keyboardType: TextInputType.text,
                  onTapOutside: (_) => context.unFocusField(),
                  textInputAction: TextInputAction.search,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 11.5,
                      horizontal: 15,
                    ),
                    prefixIcon: const JRSvgPicture(
                      assetName: Vectors.search,
                      height: 16,
                      width: 16,
                      fit: BoxFit.none,
                    ),
                    hintText: Str.current.search,
                    hintStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.whiteFontColor,
                    ),
                    fillColor: AppColors.slate,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        AppConstant.roundedBorder8,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.orange,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        AppConstant.roundedBorder8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Observer(builder: (context) {
              return Expanded(
                child: store.countryState.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : (store.isSearchResultEmpty || store.countryState.isFailed)
                        ? Text(
                            Str.current.oopsNoResultsFound,
                            style: context.textTheme.bodyMedium,
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            itemCount: store.searchCountry.length,
                            itemBuilder: (context, index) {
                              final country = store.searchCountry[index];
                              final isCountryValid =
                                  country.flag.isNotNullOrEmpty &&
                                      country.name.isNotNullOrEmpty &&
                                      country.telCode.isNotNullOrEmpty;
                              return isCountryValid
                                  ? GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        final PhoneNavDm phoneNavDm = (
                                          country: country,
                                          userType: userType,
                                          phoneNumber: null,
                                        );
                                        Navigator.of(context).pushNamed(
                                          AppRoutes.enterPhoneNumberScreen,
                                          arguments: phoneNavDm,
                                        );
                                      },
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 37,
                                          vertical: 12,
                                        ),
                                        leading: SizedBox(
                                          height: 22,
                                          width: 34,
                                          child: JRSvgPicture(
                                            isSvgNetwork: true,
                                            fit: BoxFit.cover,
                                            assetName: country.flag!,
                                          ),
                                        ),
                                        title: Text(
                                          country.name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.displayMedium
                                              ?.copyWith(
                                            color: AppColors.whiteFontColor,
                                          ),
                                        ),
                                        trailing: Text(
                                          country.telCode!,
                                          style: context.textTheme.bodySmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.whiteFontColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                            separatorBuilder: (context, index) =>
                                const JrOpaqueDivider(),
                          ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
