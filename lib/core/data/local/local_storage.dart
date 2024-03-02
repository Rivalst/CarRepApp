import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalUserStorage {
  Future<String> getUserName();
  Future<void> setUserName(String username);
}

class LocalUserStorageImpl implements LocalUserStorage {
  final SharedPreferences _sharedPreferences;

  LocalUserStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<String> getUserName() async {
    final username = _sharedPreferences.getString('username');
    return username ?? '';
  }

  @override
  Future<void> setUserName(String username) async {
    _sharedPreferences.setString('username', username);
  }
}
