import 'package:flutter/cupertino.dart';
import 'package:module_a_practice3/data/repositories/auth_repository.dart';

final SignInProvider signInProvider = SignInProvider();

class SignInProvider extends ChangeNotifier {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isUsernameError = false;
  bool isPasswordError = false;
  bool isSignInError = false;

  bool passwordReset = false;

  bool usernameTextField() {
    if(usernameController.text.length >= 4) {
      return true;
    }
    return false;
  }

  bool passwordTextField() {
    if(passwordController.text.length >= 4) {
      return true;
    }
    return false;
  }

  Future<bool> signInTest() async {
    if(await authRepository.signIn(usernameController.text, passwordController.text) == true) {
      return true;
    }
    return false;
  }

  void viewNameError() async {
    isUsernameError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isUsernameError = false;
    notifyListeners();
  }

  void viewPasswordError() async {
    isPasswordError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isPasswordError = false;
    notifyListeners();
  }

  void viewSignInError() async {
    isSignInError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isSignInError = false;
    notifyListeners();
  }

  void viewPasswordResetError() async {
    passwordReset = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    passwordReset = false;
    notifyListeners();
  }

}