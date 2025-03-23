import 'package:flutter/cupertino.dart';

import '../../data/repositories/auth_repository.dart';

final SignUpProvider signUpProvider = SignUpProvider();

class SignUpProvider extends ChangeNotifier {

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isIdError = false;
  bool isPasswordError = false;
  bool isNameError = false;
  bool isConfirmPasswordError = false;
  bool isSignUpError = false;

  bool passwordReset = false;

  Future<bool> nameTextField() async {
    if(nameController.text.isNotEmpty) {
      return true;
    }
    isNameError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isNameError = false;
    notifyListeners();
    return false;
  }

  Future<bool> idTextField() async {
    if(idController.text.isNotEmpty) {
      return true;
    }
    isIdError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isIdError = false;
    notifyListeners();
    return false;
  }

  Future<bool> passwordTextField() async {
    if(passwordController.text.length >= 4) {
      return true;
    }
    isPasswordError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isPasswordError = false;
    notifyListeners();
    return false;
  }

  Future<bool> confirmPasswordTextField() async {
    if(confirmPasswordController.text.length >= 4 && confirmPasswordController.text == passwordController.text) {
      return true;
    }
    isConfirmPasswordError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isConfirmPasswordError = false;
    notifyListeners();
    return false;
  }

  Future<bool> signUpTest() async {
    if(await authRepository.signUp(idController.text, passwordController.text, nameController.text) == true) {
      return true;
    }
    isSignUpError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isSignUpError = false;
    notifyListeners();
    return false;
  }

  void viewPasswordResetError() async {
    passwordReset = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    passwordReset = false;
    notifyListeners();
  }

}