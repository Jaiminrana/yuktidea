import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yuktidea/model/api_response/APIResponse.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';
import 'package:yuktidea/model/study_country/study_country_req_dm.dart';
import 'package:yuktidea/model/study_country/study_country_res_dm.dart';
import 'package:yuktidea/model/verify_otp/verify_otp_req_dm.dart';
import 'package:yuktidea/model/verify_otp/verify_otp_res_dm.dart';

import '../model/login/otp_req_dm.dart';

part 'apiservice.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('/api/countries')
  Future<APIResponse<List<CountryDataResDm>>> getCountryData();

  @POST('/api/{apiType}')
  Future<APIResponse<dynamic>> getOTP({
    @Path() required String apiType,
    @Body() required OtpReqDm otpReqDm,
  });

  @POST('/api/verify-otp')
  Future<APIResponse<VerifyOtpResDm>> verifyOTP({
    @Body() required VerifyOtpReqDm verifyOtpReqDm,
  });

  @GET('/api/select/country')
  Future<APIResponse<SelectCountryDm>> getSelectCountryData();

  @POST('/api/select/country')
  Future<APIResponse<StudyCountryResDm>> selectedStudyCountry({
    @Body() required StudyCountryReqDm studyCountryReqDm,
  });

  @POST('/api/logout')
  Future<APIResponse<dynamic>> logout();

  @POST('/api/delete')
  Future<APIResponse<dynamic>> delete();
}
