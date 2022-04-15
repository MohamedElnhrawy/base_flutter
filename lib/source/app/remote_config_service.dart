import 'package:base_flutter/source/data/network/error_handler.dart';
import 'package:base_flutter/source/data/network/failure.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

const String _IosLatesVersion = 'ios_latest_version';
const String _AndroidLatestVersion = 'android_latest_version';

class RemoteConfigService {
  final RemoteConfig _remoteConfig;

  static RemoteConfigService? _instance;

  static Future<RemoteConfigService> get getInstance async =>
      _instance ??= await RemoteConfigService(
        remoteConfig: await RemoteConfig.instance,
      );

  RemoteConfigService({required RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  final defaults = <String, dynamic>{
    _AndroidLatestVersion: 1,
    _IosLatesVersion: 1,
  };

  Future initialise() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _remoteConfig.fetchAndActivate();
    } catch (exception) {
      throw Failure(ResponseCode.REMOTE_CONFIG, ResponseMessages.REMOTE_CONFIG);
    }
  }

  int get androidLatestVersion => _remoteConfig.getInt(_AndroidLatestVersion);
  int get iOSLatestVersion => _remoteConfig.getInt(_AndroidLatestVersion);
}
