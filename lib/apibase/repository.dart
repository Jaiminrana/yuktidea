import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:yuktidea/apibase/apiservice.dart';
import 'package:yuktidea/apibase/header_intercepter.dart';
import 'package:yuktidea/apibase/tuple.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/api_response/APIResponse.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/model/login/otp_req_dm.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';
import 'package:yuktidea/model/study_country/study_country_req_dm.dart';
import 'package:yuktidea/model/study_country/study_country_res_dm.dart';
import 'package:yuktidea/model/verify_otp/verify_otp_req_dm.dart';
import 'package:yuktidea/model/verify_otp/verify_otp_res_dm.dart';
import 'package:yuktidea/utils/exception.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/utils/network_utils.dart';
import 'package:yuktidea/utils/typedefs.dart';
import 'package:yuktidea/values/app_constant.dart';

class Repository {
  Repository._();

  late ApiService _apiService;

  final logInterceptor = LogInterceptor(
    requestBody: !kReleaseMode,
    responseBody: !kReleaseMode,
    request: !kReleaseMode,
    requestHeader: !kReleaseMode,
    responseHeader: !kReleaseMode,
  );

  static final Repository instance = Repository._();

  void initialise() {
    final dio = Dio();

    dio.interceptors.add(
      HeaderInterceptor(),
    );

    _apiService = ApiService(
      dio: dio,
      baseUrl: AppConstant.baseUrl,
    );
  }

  Future<String> getOtp({
    required String apiType,
    required OtpReqDm otpReqDm,
  }) async {
    final response = await _apiCall(
      getOnlyMessage: true,
      request: () => _apiService.getOTP(
        apiType: apiType,
        otpReqDm: otpReqDm,
      ),
    );
    return response.message!;
  }

  Future<VerifyOtpResDm> verifyOtp({
    required VerifyOtpReqDm verifyOtpReqDm,
  }) async {
    final response = await _apiCall(
      request: () => _apiService.verifyOTP(
        verifyOtpReqDm: verifyOtpReqDm,
      ),
    );
    return response.data!;
  }

  Future<List<CountryDataResDm>> getCountryData() async {
    final response = await _apiCall(
      request: () => _apiService.getCountryData(),
    );
    return response.data!;
  }

  Future<SelectCountryDm> getSelectCountryData() async {
    final response = await _apiCall(
      request: () => _apiService.getSelectCountryData(),
    );
    return response.data!;
  }

  Future<APITuple<StudyCountryResDm>> setSelectedCountryForStudy({
    required StudyCountryReqDm studyCountryReqDm,
  }) async {
    final response = await _apiCall(
      request: () => _apiService.selectedStudyCountry(
        studyCountryReqDm: studyCountryReqDm,
      ),
    );
    return response;
  }

  Future<String> logout() async {
    final response = await _apiCall(
      getOnlyMessage: true,
      request: () => _apiService.logout(),
    );
    return response.message!;
  }

  Future<String> delete() async {
    final response = await _apiCall(
      getOnlyMessage: true,
      request: () => _apiService.delete(),
    );
    return response.message!;
  }

  Future<APITuple<T>> _apiCall<T>({
    required ApiCallback<T> request,
    bool getOnlyMessage = false,
    bool getIfNull = false,
  }) async {
    final internet = await NetworkUtils.instance.checkHasInternet();
    if (!internet) {
      throw JRException(Str.current.noInternetConnection);
    }
    try {
      final response = await request();
      if (getOnlyMessage) {
        /// Will return message on 200 Code if [getMessage] is true
        return APITuple(
          data: null,
          message: response.message ?? 'Success',
        );
      } else if (getIfNull || response.data != null) {
        /// Will return actual data
        return APITuple(
          data: response.data,
          message: response.message,
        );
      } else {
        throw JRException(Str.current.noDataFound);
      }
    } on String {
      rethrow;
    } on DioException catch (error) {
      if (error.response == null) {
        if (error.type == DioExceptionType.unknown) {
          throw JRException(Str.current.noInternetConnection);
        } else {
          throw JRException(Str.current.somethingWentWrong);
        }
      }
      if (error.response!.data is Map<String, dynamic>) {
        final response = APIResponse(
          status: error.response?.data['status'],
          data: error.response?.data['data'],
          message: error.response?.data['message'],
        );

        switch (error.response?.statusCode) {
          case 500:
          case 503:
          case 504:
          case 403:
          case 422:
          case 404:
          case 405:
          default:
            throw JRException(
              response.message.toString(),
              data: response.data.toString(),
              status: response.status,
              statusCode: error.response?.statusCode.toString(),
            );
        }
      } else {
        final statusCode = error.response?.statusCode;
        final statusMessage = error.response?.statusMessage;
        final msg = statusCode.toString().isNullOrEmpty &&
                statusMessage.toString().isNotNullOrEmpty
            ? kDebugMode
                ? '$statusCode $statusMessage'
                : statusMessage
            : null;
        throw JRException(
          msg ?? Str.current.invalidResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
