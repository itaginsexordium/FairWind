import 'package:fairwind/src/common/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ILocalStorageDataProvider {
  String? getString(String key);
  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
  List<String>? getStringList(String key);
  Future<bool> setString(String key, String value);
  Future<bool> setBool(String key, bool value);
  Future<bool> setInt(String key, int value);
  Future<bool> setDouble(String key, double value);
  Future<bool> setStringList(String key, List<String> values);
  Future<bool> remove(String key);
  Future<bool> clear();
}

final class LocalStorageDataProvider
    with BaseDataProviderMixin
    implements ILocalStorageDataProvider {
  final SharedPreferences _prefs;

  const LocalStorageDataProvider({required final SharedPreferences prefs})
      : _prefs = prefs;

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  @override
  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  @override
  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> values) {
    return _prefs.setStringList(key, values);
  }

  @override
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  @override
  Future<bool> clear() {
    return _prefs.clear();
  }
}
