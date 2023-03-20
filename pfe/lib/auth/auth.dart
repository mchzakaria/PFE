import 'package:google_sign_in/google_sign_in.dart';
import 'package:pfe/widget/widgets.dart';

class Auth {
  final fireAuth = FirebaseAuth.instance;
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await fireAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Future<UserCredential> registerNewUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   return await fireAuth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  // }

  Future<void> logout() async {
    await fireAuth.signOut();
  }

  signWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
