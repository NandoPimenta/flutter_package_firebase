import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfig {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  config({int fetchTimeout = 5, int minimumFetchInterval = 5}) async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: fetchTimeout),
      minimumFetchInterval: Duration(seconds: minimumFetchInterval),
    ));
  }

  Future<Map<String, RemoteConfigValue>> getAllRemote() async {
    await _remoteConfig.fetchAndActivate();
    return _remoteConfig.getAll();
  }

  Future<dynamic> getByKey({required String key}) async {
    try {
      await _remoteConfig.fetchAndActivate();
      var all = _remoteConfig.getAll();
      return json.decode(all[key]?.asString() ?? "");
    } catch (e) {
      return {"data": []};
    }
  }
}
