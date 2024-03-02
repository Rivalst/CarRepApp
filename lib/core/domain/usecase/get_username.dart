import 'package:test_2s_app/core/domain/repository/user_repository.dart';

class GetUserName {
  final UserRepository _repository;

  GetUserName({
    required UserRepository repository,
  }) : _repository = repository;

  Future<String> call() async {
    final username = await _repository.getUserName();
    return username;
  }
}
