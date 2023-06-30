import '../../models/user_model.dart';

abstract class IUserRepository {
  Stream<UserModel> getUser(String id);
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
}
