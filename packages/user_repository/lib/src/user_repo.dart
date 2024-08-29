abstract interface class UserRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);
}
