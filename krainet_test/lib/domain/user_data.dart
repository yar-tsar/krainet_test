import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static UserData? isSignedIn;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future isLoggedIn() async {
    final user = await FirebaseAuth.instance.currentUser;
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
        final credential = (FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password));
      } on FirebaseAuthException catch (e) {
        //TODO: implement error handling
        if (e.code == 'email-already-in-use') {
          print('The account already exists');
        } else {
          print(e.message);
        }
      }
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
