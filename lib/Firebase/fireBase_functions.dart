import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {

  creatTaskes(){
    FirebaseFirestore.instance.collection("tasks").
    add
  }

  static Future<String?> creatNewUser({
    required String email,
    required String password,
    required String name,
   // required Function onSuccess,
    //required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //add to DB
     // onSuccess();
      await credential.user!.sendEmailVerification();

      return null ;
    }
    on FirebaseAuthException catch (e) {
      //onError(e.message);
      return e.message?? "Register failed" ;

    }
  }

  static Future<String?> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null && !credential.user!.emailVerified) {
        return "Please verify your email first";
      }

      return null;
      //add to DB
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Login failed";
    }
  }

  static bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

}
