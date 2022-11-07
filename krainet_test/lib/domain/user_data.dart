import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static UserData? isSignedIn;

  static Future isLoggedIn() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user?.uid != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> signUp(
    String name,
    String email,
    String birthday,
    String password,
    bool isFormFilled,
  ) async {
    if (isFormFilled == true) {
      try {
        // ignore: unused_local_variable
        final credential = (FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password));
      } on FirebaseAuthException catch (e) {
        //TODO: implement error handling
        if (e.code == 'email-already-in-use') {
          log('The account already exists');
        } else {
          log(e.message.toString());
        }
      }
    }
  }

  static Future<void> signIn(
    String email,
    String password,
    bool isFormFilled,
  ) async {
    if (isFormFilled == true) {
      try {
        // ignore: unused_local_variable
        final credential = (FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password));
      } on FirebaseAuthException catch (e) {
        //TODO: implement error handling
        log(e.message.toString());
      }
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
