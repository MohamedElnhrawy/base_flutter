import 'package:base_flutter/source/data/responses/basic_response.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseDataResponse<T> extends BasicResoponse {
  final T data;

  BaseDataResponse(
    this.data, {
    bool? success,
    String? message,
    ResponseError? error,
  }) : super(success: success, message: message, error: error);

  factory BaseDataResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseDataResponse<T>(
      create(json['result']),
    )
      ..error =
          json['error'] != null ? ResponseError.fromJson(json['error']) : null
      ..message = json['message']
      ..success = json['success'];
  }
}
