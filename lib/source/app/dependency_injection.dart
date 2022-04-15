import 'package:base_flutter/source/data/data_sources/assets_data_source.dart';
import 'package:base_flutter/source/data/data_sources/remote_data_source.dart';
import 'package:base_flutter/source/data/network/app_api.dart';
import 'package:base_flutter/source/data/network/dio_factory.dart';
import 'package:base_flutter/source/data/network/network_info.dart';
import 'package:base_flutter/source/data/repos/authenticatoin_repo_impl.dart';
import 'package:base_flutter/source/domain/repos/authentication_repo.dart';
import 'package:base_flutter/source/presentation/resources/langauge_manager.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences.dart';
import 'remote_config_service.dart';

final diInstance = GetIt.instance;

Future<void> initAppModule() async {
  //sharedpreferences instance
  var sharedPreferences = await SharedPreferences.getInstance();
  diInstance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //appPreferences instance
  diInstance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(diInstance<SharedPreferences>()));

  //networkinfo instance
  diInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  //dioFactory instance
  diInstance.registerLazySingleton<DioFactory>(
      () => DioFactory(diInstance<AppPreferences>()));

  //AppServiceClient instance
  Dio dio = await diInstance<DioFactory>().getDio();
  diInstance
      .registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //firebase remote config instance
  var remoteConfigService = await RemoteConfigService.getInstance;
  diInstance
      .registerLazySingleton<RemoteConfigService>(() => remoteConfigService);

  //remote data source impl instance
  diInstance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
        diInstance<AppServiceClient>(),
      ));



  //assets data source impl instance
  diInstance
      .registerLazySingleton<AssetsDataSource>(() => AssetsDataSourceImpl());


  //authentication repo imple instance
  diInstance.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(
        diInstance<RemoteDataSource>(),
        diInstance<AssetsDataSource>(),
        diInstance<NetworkInfo>(),
      ));

  diInstance.registerFactory<LocalizationManager>(() => LocalizationManager());


}


