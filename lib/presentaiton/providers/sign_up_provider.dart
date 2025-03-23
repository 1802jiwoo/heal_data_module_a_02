import 'package:flutter/cupertino.dart';

final SignUpProvider signUpProvider = SignUpProvider();

class SignUpProvider extends ChangeNotifier {

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool passwordReset = false;


  void viewPasswordResetError() async {
    passwordReset = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    passwordReset = false;
    notifyListeners();
  }

}