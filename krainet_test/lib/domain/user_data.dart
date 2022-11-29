import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static UserData? isSignedIn;

  static Future isLoggedIn() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      log('User is not found');
      return false;
    } else {
      log('User is logged in');
      return true;
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
          throw ('The account already exists');
        } else {
          throw (e.message.toString());
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
        if (e.code == 'user-not-found') {
          throw ('The account not found');
        } else if (e.code == 'invalid-email') {
          throw ('The account not found');
        } else if (e.code == 'wrong-password') {
          throw ('The account not found');
        } else {
          throw (e.message.toString());
        }
      }
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
