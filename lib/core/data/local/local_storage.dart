import 'package:shared_preferences/shared_preferences.dart';

/// Abstract class representing a local user storage,
/// which defines methods for getting and setting the username asynchronously.
abstract class LocalUserStorage {
  Future<String> getUserName();
  Future<void> setUserName(String username);
}

/// Implementation of the [LocalUserStorage] interface. This class stores the
/// username using the provided SharedPreferences service. It implements the
/// getUserName() method to retrieve the username asynchronously
/// and the setUserName() method to store the username asynchronously.
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
