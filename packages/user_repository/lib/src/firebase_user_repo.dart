import 'package:user_repository/user_repository.dart';

class FirebaseUserRepo implements UserRepository {
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }
}
