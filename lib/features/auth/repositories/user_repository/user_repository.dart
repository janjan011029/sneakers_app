import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sneakers_app/features/auth/models/user_model.dart';
import 'package:sneakers_app/features/auth/repositories/user_repository/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) async {
    await _firebaseFirestore
        .collection('user')
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  Stream<UserModel> getUser(String id) {
    print("Getting user data from Cloud Firestore");
    return _firebaseFirestore
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snap) => UserModel.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(UserModel user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => print("User Document Updated"));
  }
}
