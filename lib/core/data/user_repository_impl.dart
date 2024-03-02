import 'package:test_2s_app/core/data/local/local_storage.dart';
import 'package:test_2s_app/core/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalUserStorage _localUserStorage;

  UserRepositoryImpl({
    required LocalUserStorage localUserStorage,
  }) : _localUserStorage = localUserStorage;

  @override
  Future<String> getUserName() async {
    final username = await _localUserStorage.getUserName();
    return username;
  }
}
