import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yuktidea/model/api_response/APIResponse.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/model/login/login_req_dm.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';

part 'apiservice.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('api/student/login')
  Future<APIResponse> getOTP({
    required LoginReqDm loginReqDm,
  });

  @GET('/api/verify-otp')
  Future<APIResponse> verifyOTP({
    required LoginReqDm loginReqDm,
  });

  @GET('/api/countries')
  Future<APIResponse<List<CountryDataResDm>>> getCountryData();

  @GET('/api/select/country')
  Future<APIResponse<SelectCountryDm>> getSelectCountryData();
}
