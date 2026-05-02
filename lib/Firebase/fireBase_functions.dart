import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  //String email;
  static Future<void> creatNewUser({
    required String email,
    required String password,
    required String name,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //add to DB
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
      print("${e.message}");
    } catch (e) {
      onError("Something Went Wrong");
      print(e);
    }
  }

  static Future<void> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //add to DB
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(email);
  }
}
