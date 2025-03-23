import 'package:flutter/material.dart';
import 'package:module_a_practice3/common/fonts.dart';
import 'package:module_a_practice3/presentaiton/components/custom_button.dart';
import 'package:module_a_practice3/presentaiton/components/custom_text_field.dart';
import 'package:module_a_practice3/presentaiton/providers/sign_up_provider.dart';
import 'package:module_a_practice3/presentaiton/screens/profile_and_target_screen.dart';
import 'package:module_a_practice3/presentaiton/screens/sign_in_screen.dart';

import '../components/custom_button2.dart';
import '../components/error_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      signUpProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    signUpProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: null,
              flexibleSpace: Center(child: Text('Sign Up', style: bodyMedium.white,)),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            body: Column(
              children: [
                Spacer(),
                Text('Your information,', style: titleBig.black87,),
                Spacer(),

                CustomTextField(hint: 'UserID', iconImage: '', controller: signUpProvider.idController, label: '', icon: Icons.person,),
                SizedBox(height: 10,),
                CustomTextField(hint: 'Username', iconImage: '', controller: signUpProvider.nameController, label: '', icon: Icons.badge_outlined,),
                SizedBox(height: 10,),
                CustomTextField(hint: 'Password', iconImage: '', controller: signUpProvider.passwordController, label: '', icon: Icons.lock, textInputType: TextInputType.visiblePassword,),
                SizedBox(height: 10,),
                CustomTextField(hint: 'Confirm Password', iconImage: '', controller: signUpProvider.confirmPasswordController, label: '', icon: Icons.lock_reset, textInputType: TextInputType.visiblePassword,),
                Spacer(),
                CustomButton(text: 'Sign Up', function: () async {
                  await signUpProvider.nameTextField()
                      ? await signUpProvider.nameTextField()
                      ? await signUpProvider.idTextField()
                      ? await signUpProvider.passwordTextField()
                      ? await signUpProvider.confirmPasswordTextField()
                      ? await signUpProvider.signUpTest()
                      ? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileAndTargetScreen(username: signUpProvider.nameController.text)))
                      : null : null : null : null : null : null;
                }),
                Spacer(),

                Container(
                  height: 180,
                  width: double.infinity,
                  color: Color(0xFFF9F9F9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton2(text: 'Sign In', function: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen()));}, outLine: true),
                      SizedBox(height: 12,),
                      CustomButton2(text: 'Password Reset', function: () {
                        signUpProvider.viewPasswordResetError();
                      }, outLine: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          signUpProvider.isIdError || signUpProvider.isNameError
              ? Align(alignment: Alignment.center, child: ErrorBox(text: '모든 항목은 필수로 입력되어야 합니다.'))
              : SizedBox.shrink(),
          signUpProvider.isPasswordError
              ? Align(alignment: Alignment.center, child: ErrorBox(text: '비밀번호는 4자리 이상이어야 합니다.'))
              : SizedBox.shrink(),
          signUpProvider.isConfirmPasswordError
              ? Align(alignment: Alignment.center, child: ErrorBox(text: '비밀번호와 비밀번호 확인은 같아야 합니다.'))
              : SizedBox.shrink(),
          signUpProvider.isSignUpError
              ? Align(alignment: Alignment.center, child: ErrorBox(text: '회원가입에 실패했습니다.'))
              : SizedBox.shrink(),
          signUpProvider.passwordReset
              ? Align(alignment: Alignment.center, child: ErrorBox(text: '준비중인 기능입니다.'))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
