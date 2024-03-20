import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import 'package:yuktidea/generated/l10n.dart';
import 'package:yuktidea/services/SnackbarService.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/utils/network_utils.dart';
import 'package:yuktidea/values/app_strings.dart';

class HeaderInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final internet = await NetworkUtils.instance.checkHasInternet();

    if (internet) {
      options.headers['Authorization'] =
          'Bearer 3|X683WgZzsA5bMlSU8GWR4anZBl71YomhuCuObRL4d664a07a';

      _printLog(
        apiMethod: options.method,
        responseBody: options.data.toString(),
        token: options.headers['Authorization'].toString(),
        parameters: options.queryParameters,
        url: sprintf(
          AppStrings.twoPlaceholdersString,
          [
            options.baseUrl,
            options.path,
          ],
        ),
      );
    } else {
      SnackbarService.showSnack(Str.current.noInternetConnection);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _printLog(
      apiMethod: response.requestOptions.method,
      responseBody: response.data.toString(),
      token: response.headers['Authorization'].toString(),
      parameters: response.requestOptions.data,
      url: sprintf(AppStrings.urlPlaceholderString, [
        response.realUri.scheme,
        response.realUri.authority,
        response.realUri.path,
      ]),
      isRequest: false,
    );
    handler.resolve(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorResponse = err.response;
    if (errorResponse != null) {
      _printErrorLog(
        responseBody: errorResponse.data.toString(),
        parameters: errorResponse.requestOptions.data,
        url: sprintf(AppStrings.urlPlaceholderString, [
          errorResponse.realUri.scheme,
          errorResponse.realUri.authority,
          errorResponse.realUri.path,
        ]),
        errorString:
            errorResponse.statusMessage ?? Str.current.oopsSomethingWentWrong,
        statusCode: errorResponse.statusCode ?? -1,
      );
      debugPrint(err.error.toString());
      debugPrintStack(stackTrace: err.stackTrace);
    }
    handler.reject(err);
  }

  static void _printLog({
    required String responseBody,
    required dynamic parameters,
    required String url,
    required String? token,
    required String apiMethod,
    bool isRequest = true,
    int spacerLines = 3,
  }) {
    final apiType = isRequest ? 'REQUEST' : 'RESPONSE';
    final log = 'flutter: --------------------------------------------\n'
        ' $apiType\n'
        '-----------------------------------------------------\n'
        ' Method :$apiMethod\n'
        '-----------------------------------------------------\n'
        'Request URL   - $url\n'
        ' Authentication Token - $token\n'
        ':: Parameters - $parameters\n'
        ':: UTC Time   - ${DateTime.now().toUtc()}\n'
        '-----------------------------------------------------\n'
        'flutter: --------------------------------------------\n'
        'Body : $responseBody\n';

    debugPrint(log.padding(spacerLines, padding: AppStrings.nextLine));
  }

  static void _printErrorLog({
    required String responseBody,
    required dynamic parameters,
    required String url,
    required String errorString,
    required int statusCode,
    int spacerLines = 3,
  }) {
    final log = 'flutter: --------------------------------------------\n'
        'RESPONSE\n'
        '-----------------------------------------------------\n'
        'Request URL   - $url\n'
        ':: Parameters - $parameters\n'
        ':: UTC Time   - ${DateTime.now().toUtc()}\n'
        '-----------------------------------------------------\n'
        'flutter: --------------------------------------------\n'
        'ERROR\n'
        '-----------------------------------------------------\n'
        'Status Code: $statusCode\n'
        'Message: $errorString\n'
        '-----------------------------------------------------\n'
        'Body : $responseBody\n';

    debugPrint(log.padding(spacerLines, padding: AppStrings.nextLine));
  }
}
