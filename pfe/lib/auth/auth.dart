import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final fireAuth = FirebaseAuth.instance;
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await fireAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> registerNewUser({
    required String email,
    required String password,
  }) async {
    return await fireAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    await fireAuth.signOut();
  }
}
