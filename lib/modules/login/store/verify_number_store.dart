import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sprintf/sprintf.dart';
import 'package:yuktidea/apibase/repository.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/helper/secured_storage_helper.dart';
import 'package:yuktidea/model/login/otp_req_dm.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';
import 'package:yuktidea/model/verify_otp/verify_otp_req_dm.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/utils/exception.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/utils/typedefs.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_constant.dart';
import 'package:yuktidea/values/app_strings.dart';
import 'package:yuktidea/values/enumerations.dart';

part 'verify_number_store.g.dart';

class VerifyNumberStore = _VerifyNumberStore with _$VerifyNumberStore;

abstract class _VerifyNumberStore with Store {
  _VerifyNumberStore({
    required this.phoneNavDm,
  });

  final PhoneNavDm phoneNavDm;

  @observable
  NetworkState resendOtpState = NetworkState.idle;

  @observable
  String? otpCode;

  @observable
  int otpLength = 0;

  @observable
  bool isValidOtp = true;

  @observable
  NetworkState verifyState = NetworkState.idle;

  @observable
  int resendCount = 10;

  Future<bool> verifyOtp() async {
    if (otpCode.isNullOrEmpty || otpLength < 4) {
      SnackBarService.showSnack(
        title: Str.current.badRequest,
        color: AppColors.red,
        Str.current.enterAValidOtp,
      );
      return false;
    }
    try {
      verifyState = NetworkState.loading;
      final result = await Repository.instance.verifyOtp(
        verifyOtpReqDm: VerifyOtpReqDm(
          code: otpCode!,
          phone: sprintf(
            AppStrings.twoPlaceholdersString,
            [
              phoneNavDm.country.telCode,
              phoneNavDm.phoneNumber,
            ],
          ),
        ),
      );
      verifyState = NetworkState.success;
      isValidOtp = true;
      if (result.accessToken.isNotNullOrEmpty) {
        saveAuthTokenInSecuredStorage(result.accessToken!);
      }
      return true;
    } catch (e) {
      isValidOtp = false;
      verifyState = NetworkState.error;
      SnackBarService.showSnack(
        (e as JRException).data.toString(),
        textStyle: const TextStyle(
          color: AppColors.pureBlack,
        ),
      );
      debugPrint(e.toString());
      return false;
    }
  }

  @action
  Future<void> resendOtpTimer() async {
    getOtpAgain();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (resendCount == 0) {
          resendCount = 10;
          timer.cancel();
        } else {
          resendCount--;
        }
      },
    );
  }

  @action
  void trackOtpLength(String otpValue) {
    if (otpValue.isNullOrEmpty && otpLength != 0) {
      otpLength -= 1;
    } else {
      otpLength += 1;
    }
  }

  Future<bool> getOtpAgain() async {
    try {
      resendOtpState = NetworkState.loading;
      final result = await Repository.instance.getOtp(
        apiType: phoneNavDm.userType.isStudent
            ? AppConstant.studentEndPoint
            : AppConstant.agentEndPoint,
        otpReqDm: OtpReqDm(
          telCode: phoneNavDm.country.telCode.toString(),
          phone: phoneNavDm.phoneNumber.toString(),
        ),
      );
      if (result.isNullOrEmpty) {
        SnackBarService.showSnack(result);
        return false;
      }
      resendOtpState = NetworkState.success;
      return true;
    } catch (e) {
      resendOtpState = NetworkState.error;
      SnackBarService.showSnack(
        e.toString(),
        textStyle: const TextStyle(
          color: AppColors.red,
        ),
      );
      debugPrint(e.toString());
      return false;
    }
  }
}

void saveAuthTokenInSecuredStorage(String authToken) {
  SecuredStorageHelper.instance.setSecuredProperty(
    key: SecureStorageKeyEnum.authToken,
    value: authToken,
  );
}
