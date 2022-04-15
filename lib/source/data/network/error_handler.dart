import 'package:base_flutter/source/app/extensions.dart';
import 'package:base_flutter/source/data/responses/basic_response.dart';
import 'package:dio/dio.dart';


import 'failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  NO_INTERNET_CONNECTION,
  CACHE_ERROR,
}

class ResponseCode {
  //API status codes
  static const int SUCCESS = 200; //success with data
  static const int NO_CONTENT = 201; //success with no content
  static const int BAD_REQUEST = 400; //failure, API rejected the request
  static const int FORBIDDEN = 403; //failure, API rejected the request
  static const int UNAUTHORIZED = 401; //failure, user is not authorized
  static const int NOT_FOUND = 404; //faulire, url is not correct and not found
  static const int INTERNAL_SERVER_ERROR = 500; //faulire, crash on server side

  //local status code
  static const int UNKNOWN = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECIEVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int CACHE_ERROR = -7;
  static const int LOGOUT = -8;
  static const int REMOTE_CONFIG = -9;
  static const int REQUEST_ERROR = -10;
  static const int SERVER_ERROR = -11;

  static const int OTP_ALREADY_SENT = 1001;
}

class ResponseMessages {
  //API status codes
  static const String SUCCESS = 'success '; //success with data
  static const String NO_CONTENT =
      'success with no content'; //success with no content
  static const String BAD_REQUEST =
      'Bad Request, try again later'; //failure, API rejected the request
  static const String FORBIDDEN =
      'forbidden reuest, try again later'; //failure, API rejected the request
  static const String UNAUTHORIZED =
      'User unauthorized, try again later'; //failure, user is not authorized
  static const String NOT_FOUND =
      'URL not found, try again later'; //faulire, url is not correct and not found
  static const String INTERNAL_SERVER_ERROR =
      'Something went wrong, try again later'; //faulire, crash on server side

  //local status code
  static const String UNKNOWN = 'Something went wrong, try again later';
  static const String CONNECT_TIMEOUT = 'timeout error, try again later';
  static const String CANCEL = 'request was cancelled, try again later';
  static const String RECIEVE_TIMEOUT = 'timeout error, try again later';
  static const String SEND_TIMEOUT = 'timeout error, try again later';
  static const String NO_INTERNET_CONNECTION =
      'Please check your internet connectoin';
  static const String CACHE_ERROR = 'cache error, try again later';
  static const String REMOTE_CONFIG = 'remote config error, try again later';
  static const String REQUEST_ERROR = 'REQUEST_ERROR';
  static const String SERVER_ERROR = 'SERVER_ERROR';
  static const String LOCATION_PERMISSION_DENIED = 'LOCATION_PERMISSION_DENIED';
  static const String LOCATION_SERVICE_DISABLED = 'LOCATION_SERVICE_DISABLED';
}

class LocalFailureCodes {
  static const int NO_INTERNET_CONNECTION = -6;
  static const int CACHE_ERROR = -7;
  static const int LOGOUT = -8;
  static const int REMOTE_CONFIG = -9;
  static const int LOCATION_PERMISSION_DENIED = -10;
  static const int LOCATION_SERVICE_DISANLED = -11;
}

class LocalFailureMessage {
  LocalFailureMessage._();

  static String getMessage(int code) {
    switch (code) {
      case LocalFailureCodes.NO_INTERNET_CONNECTION:
        return ResponseMessages.NO_INTERNET_CONNECTION;
      case LocalFailureCodes.CACHE_ERROR:
        return ResponseMessages.CACHE_ERROR;
      case LocalFailureCodes.REMOTE_CONFIG:
        return ResponseMessages.REMOTE_CONFIG;
      case LocalFailureCodes.LOCATION_PERMISSION_DENIED:
        return ResponseMessages.LOCATION_PERMISSION_DENIED;
      case LocalFailureCodes.LOCATION_SERVICE_DISANLED:
        return ResponseMessages.LOCATION_SERVICE_DISABLED;
    }

    return '';
  }
}

class ErrorHandler {
  static Failure handleNetworkError(DioError e) {
    if (e.response?.data != null) {
      final data = e.response?.data;
      BasicResoponse response = BasicResoponse.fromJson(data);
      return Failure(
          response.error?.code?.orZero() ?? 0,
          response.error?.details?.orEmpty() ??
              response.error?.message?.orEmpty() ??
              '');
    }

    if (e.type == DioErrorType.response) {
      return Failure(
          ResponseCode.REQUEST_ERROR, ResponseMessages.REQUEST_ERROR);
    }
    if (e.type == DioErrorType.connectTimeout) {
      return Failure(
          ResponseCode.CONNECT_TIMEOUT, ResponseMessages.CONNECT_TIMEOUT);
    }

    if (e.type == DioErrorType.receiveTimeout) {
      return Failure(
          ResponseCode.RECIEVE_TIMEOUT, ResponseMessages.RECIEVE_TIMEOUT);
    }
    return Failure(ResponseCode.SERVER_ERROR, ResponseMessages.SERVER_ERROR);
  }
}
