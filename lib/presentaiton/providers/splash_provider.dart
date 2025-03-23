import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_a_practice3/presentaiton/screens/sign_in_screen.dart';

final SplashProvider splashProvider = SplashProvider();

class SplashProvider extends ChangeNotifier {

  bool isLogoAnimation = false;
  bool isTextAnimation = false;

  void startAnimation(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));

    isLogoAnimation = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));

    isTextAnimation = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen()));

  }

}