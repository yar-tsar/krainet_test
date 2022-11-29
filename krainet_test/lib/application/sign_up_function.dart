import '../domain/user_data.dart';

signUp(String name, String email, String birthday, String password,
    bool isFormFilled) {
  if (isFormFilled == true) {
    UserData.signUp(name, email, birthday, password, isFormFilled);
  }
}
