import 'package:test_2s_app/core/data/local/local_storage.dart';

/// Usecase responsible for setting the username in the local user storage.
/// It utilizes the [LocalUserStorage] service to save the username asynchronously.
class SetUserName {
  final LocalUserStorage _localUserStorage;

  SetUserName({
    required LocalUserStorage localUserStorage,
  }) : _localUserStorage = localUserStorage;

  Future<void> call(String username) async {
    await _localUserStorage.setUserName(username);
  }
}
