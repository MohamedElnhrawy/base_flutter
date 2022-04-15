import 'package:json_annotation/json_annotation.dart';

class BasicResoponse {
  bool? success;
  String? message;
  ResponseError? error;

  BasicResoponse({this.success, this.message, this.error});

  factory BasicResoponse.fromJson(Map<String, dynamic> json) => BasicResoponse()
    ..success = json['success']
    ..message = json['message']
    ..error =
        json['error'] != null ? ResponseError.fromJson(json['error']) : null;
}

@JsonSerializable()
class ResponseError {
  int? code;
  String? message;
  String? details;

  ResponseError();

  factory ResponseError.fromJson(Map<String, dynamic> json) => ResponseError()
    ..code = json['code'] as int?
    ..message = json['message'] as String?
    ..details = json['details'] as String?;
}
