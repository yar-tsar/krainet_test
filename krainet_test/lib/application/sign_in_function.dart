import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import '../domain/user_data.dart';

signIn(String email, String password, bool isFormFilled) async {
  if (isFormFilled == true) {
    try {
      await UserData.signIn(email, password, isFormFilled);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}
