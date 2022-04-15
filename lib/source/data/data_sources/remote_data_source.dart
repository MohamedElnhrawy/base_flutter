import 'package:base_flutter/source/data/network/app_api.dart';

abstract class RemoteDataSource {
  // Future<BasicResoponse> sendOtp(SendOtpRequest otpRequest);

}

class RemoteDataSourceImpl implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  // @override
  // Future<BasicResoponse> sendOtp(SendOtpRequest otpRequest) async {
  //   return await _appServiceClient
  //       .sendOTP(Uri.encodeComponent(otpRequest.userName));
  // }


}
