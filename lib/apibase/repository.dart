import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:yuktidea/apibase/apiservice.dart';
import 'package:yuktidea/apibase/header_intercepter.dart';
import 'package:yuktidea/apibase/server_error.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';
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

  Future<List<CountryDataResDm>> getCountryData() async {
    final response = await _apiCall(
      request: () => _apiService.getCountryData(),
    );
    return response;
  }

  Future<SelectCountryDm> getSelectCountryData() async {
    return _apiCall(
      request: () => _apiService.getSelectCountryData(),
    );
  }

  Future<T> _apiCall<T>({required ApiCallback<T> request}) async {
    try {
      final response = await request();
      if (response.data != null) {
        return response.data!;
      } else {
        throw Exception(Str.current.noDataFound);
      }
    } on DioException catch (error) {
      throw ServerError.fromDioException(exception: error);
    }
  }
}
