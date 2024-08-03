import 'package:flutter_utils/src/core/services/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends Storage {
  SharedPreferencesService({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const String keyLanguage = "language";
  static const String keyCountryLanguage = "countryLanguage";

  @override
  Future<void> write({required String key, required data}) async {
    await _write(key: key, data: data);
  }

  @override
  dynamic read({required String key}) {
    dynamic data = _sharedPreferences.get(key);
    return data; 
  }

  @override
  Future<void> delete({required String key}) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

  Future<void> _write({required String key, required data}) async {
    dynamic dataType = data.runtimeType;
    switch (dataType) {
      case String:
        await _sharedPreferences.setString(key, data);
        break;
      case int:
        await _sharedPreferences.setInt(key, data);
        break;
      case double:
        await _sharedPreferences.setDouble(key, data);
        break;
      case bool:
        await _sharedPreferences.setBool(key, data);
        break;
      case List:
        await _sharedPreferences.setStringList(key, data);
        break;
      default:
        await _sharedPreferences.setString(key, data.toString());
    } 
  }
}
