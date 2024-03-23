import 'package:flutter/material.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/modules/login/store/enter_phone_number_store.dart';
import 'package:yuktidea/modules/login/store/get_country_store.dart';
import 'package:yuktidea/modules/login/store/verify_number_store.dart';
import 'package:yuktidea/modules/login/view/enter_phone_number_screen.dart';
import 'package:yuktidea/modules/login/view/get_country_screen.dart';
import 'package:yuktidea/modules/onboarding/store/select_country_store.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_screen.dart';
import 'package:yuktidea/modules/onboarding/view/welcome/store/welcome_store.dart';
import 'package:yuktidea/modules/start_up/start_up_screen.dart';
import 'package:yuktidea/modules/start_up/terms_of_service_screen.dart';
import 'package:yuktidea/utils/common%20widgets/invalid_route.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/utils/typedefs.dart';
import 'package:yuktidea/values/app_routes.dart';
import 'package:yuktidea/values/enumerations.dart';

import 'modules/login/view/verify_number_screen.dart';
import 'modules/onboarding/view/welcome/view/welcome_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.startUpScreen:
        return getRoute(
          widget: const StartUpScreen(),
        );
      case AppRoutes.termsOfService:
        return getRoute(
          widget: const TermsOfServiceScreen(),
        );
      case AppRoutes.getCountryDataScreen:
        final userType = settings.arguments as UserType?;
        return getRoute(
          widget: userType == null
              ? const InvalidRoute()
              : GetCountryScreen(userType: userType).withProvider(
                  GetCountryStore()..initialize(),
                ),
        );
      case AppRoutes.enterPhoneNumberScreen:
        final phoneNavDm = settings.arguments as PhoneNavDm?;
        return getRoute(
          widget: phoneNavDm == null
              ? const InvalidRoute()
              : EnterPhoneNumberScreen(
                  country: phoneNavDm.country,
                ).withProvider(
                  EnterPhoneNumberStore(
                    userType: phoneNavDm.userType,
                  ),
                ),
        );

      case AppRoutes.verifyPhoneNumberScreen:
        final phoneNavDm = settings.arguments as PhoneNavDm?;
        return getRoute(
          widget: phoneNavDm == null
              ? const InvalidRoute()
              : const VerifyNumberScreen().withProvider(
                  VerifyNumberStore(
                    phoneNavDm: phoneNavDm,
                  ),
                ),
        );

      case AppRoutes.selectCountryScreen:
        return getRoute(
          widget: const SelectCountryScreen().withProvider(SelectCountryStore()..init()),
        );
      case AppRoutes.welcomeScreen:
        return getRoute(
          widget: const WelcomeScreen().withProvider(WelcomeStore()),
        );

      /// An invalid route. User shouldn't see this, it's for debugging purpose
      /// only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
