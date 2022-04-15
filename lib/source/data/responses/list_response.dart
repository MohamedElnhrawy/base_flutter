import 'package:json_annotation/json_annotation.dart';

import 'basic_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> extends BasicResoponse {
  final List<T> data;

  ListResponse(
    this.data, {
    bool? success,
    String? message,
    ResponseError? error,
  }) : super(success: success, message: message, error: error);

  factory ListResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var list = List<T>.from(json['result'].map((model) => create(model)));
    return ListResponse<T>(list)
      ..error =
          json['error'] != null ? ResponseError.fromJson(json['error']) : null
      ..message = json['message']
      ..success = json['success'];
  }
}
