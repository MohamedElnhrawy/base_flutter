import 'package:base_flutter/source/data/data_sources/assets_data_source.dart';
import 'package:base_flutter/source/data/data_sources/remote_data_source.dart';
import 'package:base_flutter/source/data/network/network_info.dart';
import 'package:base_flutter/source/domain/repos/authentication_repo.dart';


class AuthenticationRepositoryImpl extends AuthenticationRepository {
  RemoteDataSource _remoteDataSource;
  AssetsDataSource _assetsDataSource;
  NetworkInfo _networkInfo;

  AuthenticationRepositoryImpl(
      this._remoteDataSource, this._assetsDataSource, this._networkInfo);


}
