import 'dart:async';

import 'package:yuktidea/model/api_response/APIResponse.dart';

typedef ApiCallback<T> = Future<APIResponse<T>> Function();
typedef DisposeProvider<T> = FutureOr<void> Function(T value);
typedef EventCallBack = void Function(String? url, String? name);
