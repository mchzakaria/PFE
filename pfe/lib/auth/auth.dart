import 'package:google_sign_in/google_sign_in.dart';
import 'package:pfe/widget/widgets.dart';

class Auth {
  final fireAuth = FirebaseAuth.instance;
  // final user = FirebaseAuth.instance.currentUser!;
  User? user = FirebaseAuth.instance.currentUser;

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await fireAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    await fireAuth.signOut();
  }
  

//   Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

  // Future<User?> SignIn() async {
  //   final GoogleSignInAccount? account = await (googleSignIn.signIn());
  //   final GoogleSignInAuthentication? authentication =
  //       await account?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: authentication?.idToken,
  //     idToken: authentication?.accessToken,
  //   );
  //   final UserCredential authReslt =
  //       await _auth.signInWithCredential(credential);
  //   final User? user = authReslt.user;
  //   return user;
  // }

  Future<void> updateDocument(
      docid, cin, email, fname, lname, pnum, spec, vil) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('SignIn');
    final userId = user!.uid;
    print(docid.toString());
    try {
      await users.doc(docid).set({
        'CIN': cin.toString(),
        'Email': email.toString(),
        'First name': fname.toString(),
        'Last name': lname.toString(),
        'Phone Number': pnum.toString(),
        'Speciality': spec.toString(),
        'Ville': vil.toString(),
      }, SetOptions(merge: true));
      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }
}
