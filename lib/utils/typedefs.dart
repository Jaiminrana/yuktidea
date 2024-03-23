import 'dart:async';

import 'package:yuktidea/model/api_response/APIResponse.dart';
import 'package:yuktidea/model/county_data/country_data_res_dm.dart';
import 'package:yuktidea/values/enumerations.dart';

typedef ApiCallback<T> = Future<APIResponse<T>> Function();
typedef DisposeProvider<T> = FutureOr<void> Function(T value);
typedef EventCallBack = void Function(String? url, String? name);
typedef PhoneNavDm = ({
  UserType userType,
  CountryDataResDm country,
  String? phoneNumber,
});
