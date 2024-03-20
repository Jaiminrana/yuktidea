import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yuktidea/model/select_country/select_country_dm.dart';

part 'apiservice.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('/api/select/country')
  Future<SelectCountryDm> getSelectCountryData();
}
