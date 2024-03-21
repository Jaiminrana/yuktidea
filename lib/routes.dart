import 'package:flutter/material.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_screen.dart';
import 'package:yuktidea/modules/welcome/view/welcome_screen.dart';
import 'package:yuktidea/utils/common%20widgets/invalid_route.dart';
import 'package:yuktidea/values/app_routes.dart';

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
