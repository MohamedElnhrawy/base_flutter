import 'package:base_flutter/source/app/app_preferences.dart';
import 'package:base_flutter/source/app/constants.dart';
import 'package:base_flutter/source/presentation/resources/langauge_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = 'application/json';
const String CONTENT_TYPE = 'content-type';
const String ACCEPT = 'accept';
const String AUTHORIZATION = 'authorization';
const int TIME_OUT = 60 * 1000; //1 minute
const String DEFAULT_LANGUAGE = '.AspNetCore.Culture';
const String ACCEPT_LANGUAGE = 'Accept-Language';

class DioFactory {
  final AppPreferences _preferences;

  DioFactory(this._preferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String token = await _preferences.getAccessToken();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: token.isEmpty ? '' : 'Bearer $token',
      DEFAULT_LANGUAGE: LocalizationManager.isArabic ? 'ar' : 'en',
      ACCEPT_LANGUAGE: LocalizationManager.isArabic ? 'ar' : 'en',
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: TIME_OUT,
      receiveTimeout: TIME_OUT,
      headers: headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
