import 'package:flutter/material.dart';
import 'package:module_a_practice3/common/fonts.dart';
import 'package:module_a_practice3/presentaiton/components/custom_button.dart';
import 'package:module_a_practice3/presentaiton/components/custom_button2.dart';
import 'package:module_a_practice3/presentaiton/components/custom_text_field.dart';
import 'package:module_a_practice3/presentaiton/providers/sign_in_provider.dart';
import 'package:module_a_practice3/presentaiton/screens/home_screen.dart';
import 'package:module_a_practice3/presentaiton/screens/main_screen.dart';
import 'package:module_a_practice3/presentaiton/screens/sign_up_screen.dart';

import '../components/error_box.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      signInProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    signInProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 90,
                    color: Colors.black,
                    child: Text('MY Health DATA', style: titleBold.white,),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/symbol.png',
                    width: MediaQuery.sizeOf(context).width * 0.38,
                  ),
                  Spacer(),
                  Text('Please enter your information.', style: bodyMedium.grey,),
                  Spacer(),
                  CustomTextField(hint: 'Username',
                    iconImage: '',
                    controller: signInProvider.usernameController,
                    icon: Icons.person,
                    label: '',),
                  SizedBox(height: 10,),
                  CustomTextField(hint: 'Password',
                    iconImage: '',
                    controller: signInProvider.passwordController,
                    icon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    label: '',),
                  Spacer(),
                  CustomButton(text: 'Sign in', function: () async {
                    !signInProvider.usernameTextField()
                        ? signInProvider.viewNameError() : !signInProvider.passwordTextField()
                        ? signInProvider.viewPasswordError(): await signInProvider.signInTest()
                        ? Navigator.of(context)
                        .pushReplacement(
                        MaterialPageRoute(builder: (context) => MainScreen(tkn: signInProvider.tkn,))) : signInProvider.viewSignInError();
                  }),
                  Spacer(),
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: Color(0xFFF9F9F9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton2(text: 'Sign Up', function: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));}, outLine: false),
                        SizedBox(height: 12,),
                        CustomButton2(text: 'Password Reset', function: () {
                          signInProvider.viewPasswordResetError();
                        }, outLine: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          signInProvider.isUsernameError
              ? Align(alignment: Alignment.center, child: ErrorBox(text: 'username은 4자리 이상으로\n공백없이 필수 입력 항목입니다.', height: 60,))
              : SizedBox.shrink(),
          signInProvider.isPasswordError
              ? Align(alignment: Alignment.center, child: ErrorBox(text: 'password는 4자리 이상으로\n 필수 입력 항목 입니다.', height: 60,))
              : SizedBox.shrink(),
          signInProvider.isSignInError
              ? Align(alignment: Alignment.center, child: ErrorBox(text: '로그인에 실패했습니다.'))
              : SizedBox.shrink(),
          signInProvider.passwordReset
              ? Align(alignment: Alignment.center, child: ErrorBox(text: '준비중인 기능입니다.'))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
