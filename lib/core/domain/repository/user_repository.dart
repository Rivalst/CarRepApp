/// Abstract class representing a user repository, which defines a method getUserName()
/// for retrieving the username asynchronously.
/// Implementations of this class will provide concrete logic for fetching the username data.
abstract class UserRepository {
  Future<String> getUserName();
}
