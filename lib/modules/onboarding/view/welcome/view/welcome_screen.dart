import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/helper/secured_storage_helper.dart';
import 'package:yuktidea/modules/onboarding/view/welcome/store/welcome_store.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/utils/common%20widgets/jr_primary_button.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_routes.dart';
import 'package:yuktidea/values/enumerations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<WelcomeStore>();
    return ColoredBox(
      color: AppColors.backGround,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.startUpScreen,
                (route) => false,
              );
            },
            child: Text(
              Str.current.welcome,
              style: context.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 36),
          Observer(builder: (context) {
            return JrPrimaryButton(
              loading: store.logoutState.isLoading,
              title: Str.current.logOut,
              titleColor: AppColors.lightOrange,
              onTap: () => onDeleteOrLogOut(
                context: context,
                store: store,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 70,
              ),
            );
          }),
          const SizedBox(height: 36),
          Observer(builder: (context) {
            return JrPrimaryButton(
              loading: store.deleteState.isLoading,
              title: Str.current.deleteUser,
              titleColor: AppColors.lightOrange,
              onTap: () => onDeleteOrLogOut(
                isDeleteUser: true,
                context: context,
                store: store,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 70,
              ),
            );
          })
        ],
      ),
    );
  }

  Future<void> onDeleteOrLogOut({
    required WelcomeStore store,
    bool isDeleteUser = false,
    required BuildContext context,
  }) async {
    final result =
        isDeleteUser ? await store.deleteUser() : await store.logOutUser();
    if (result.isNotNullOrEmpty) {
      SnackBarService.showSnack(result!);
      await Future.delayed(const Duration(seconds: 2));
      if (context.mounted) {
        SecuredStorageHelper.instance
            .removedSecuredProperty(SecureStorageKeyEnum.authToken);
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.startUpScreen,
          (route) => false,
        );
      }
    }
  }
}
