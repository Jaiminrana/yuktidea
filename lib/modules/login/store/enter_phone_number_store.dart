import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:yuktidea/apibase/repository.dart';
import 'package:yuktidea/model/login/otp_req_dm.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/utils/exception.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_colors.dart';
import 'package:yuktidea/values/app_constant.dart';
import 'package:yuktidea/values/enumerations.dart';

part 'enter_phone_number_store.g.dart';

class EnterPhoneNumberStore = _EnterPhoneNumberStore
    with _$EnterPhoneNumberStore;

abstract class _EnterPhoneNumberStore with Store {
  Future<bool> getOtp(OtpReqDm otpReqDm) async {
    try {
      countryState = NetworkState.loading;
      final result = await Repository.instance.getOtp(
        apiType: userType.isStudent
            ? AppConstant.studentEndPoint
            : AppConstant.agentEndPoint,
        otpReqDm: otpReqDm,
      );
      if (result.isNullOrEmpty) {
        SnackBarService.showSnack(result);
        return false;
      }
      countryState = NetworkState.success;
      return true;
    } catch (e) {
      countryState = NetworkState.error;
      SnackBarService.showSnack(
        (e as JRException).data,
        title: e.message.toString(),
        color: AppColors.red,
      );
      debugPrint(e.toString());
      return false;
    }
  }

  _EnterPhoneNumberStore({
    required this.userType,
  });

  final phoneNumberController = TextEditingController();

  final UserType userType;

  @observable
  NetworkState countryState = NetworkState.idle;
}
