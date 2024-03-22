import 'package:flutter/material.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/modules/login/view/get_country_screen.dart';
import 'package:yuktidea/modules/login/view/phone_number_screen.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_screen.dart';
import 'package:yuktidea/modules/start_up/start_up_screen.dart';
import 'package:yuktidea/modules/start_up/terms_of_service_screen.dart';
import 'package:yuktidea/utils/common%20widgets/invalid_route.dart';
import 'package:yuktidea/values/app_routes.dart';

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
        return getRoute(
          widget: const GetCountryScreen(),
        );
      case AppRoutes.enterPhoneNumberScreen:
        final country = settings.arguments as CountryDataResDm?;
        return getRoute(
          widget: country == null
              ? const InvalidRoute()
              : PhoneNumberScreen(
                  country: country,
                ),
        );

      case AppRoutes.onBoardingScreen:
        return getRoute(
          widget: const SelectCountryScreen(),
        );
      case AppRoutes.welcomeScreen:
        return getRoute(
          widget: const WelcomeScreen(),
        );

      /// An invalid route. User shouldn't see this, it's for debugging purpose
      /// only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
