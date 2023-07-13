import '../../models/user_model.dart';

abstract class IUserRepository {
  Stream<User> getUser(String id);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}
