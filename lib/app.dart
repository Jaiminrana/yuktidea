import 'package:flutter/material.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/modules/onboarding/store/select_country_store.dart';
import 'package:yuktidea/modules/onboarding/view/select_county/select_country_screen.dart';
import 'package:yuktidea/routes.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_theme.dart';

class YukIdeaApp extends StatelessWidget {
  const YukIdeaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.getDarkTheme(),
      onGenerateRoute: Routes.generateRoute,
      localizationsDelegates: const [Str.delegate],
      home: const SelectCountryScreen()
          .withProvider(SelectCountryStore()..getSelectCountryData()),
    );
  }
}
