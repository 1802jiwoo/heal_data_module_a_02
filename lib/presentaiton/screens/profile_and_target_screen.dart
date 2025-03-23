import 'package:flutter/material.dart';
import 'package:module_a_practice3/presentaiton/components/custom_button.dart';
import 'package:module_a_practice3/presentaiton/components/custom_text_field.dart';
import 'package:module_a_practice3/presentaiton/providers/profile_and_target_provider.dart';
import 'package:module_a_practice3/presentaiton/screens/sign_in_screen.dart';

import '../../common/fonts.dart';

class ProfileAndTargetScreen extends StatefulWidget {
  const ProfileAndTargetScreen({super.key, required this.username});

  final String username;

  @override
  State<ProfileAndTargetScreen> createState() => _ProfileAndTargetScreenState();
}

class _ProfileAndTargetScreenState extends State<ProfileAndTargetScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileAndTargetProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    profileAndTargetProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: null,
          flexibleSpace: Center(child: Text('Profile & Target', style: bodyMedium.white,)),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Text('Hi ${widget.username}', style: titleRegular.black87,),
            ),
            Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Text('Profile,', style: titleBig.black87,),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _genderBox('Male', Icons.man),
                _genderBox('Female', Icons.woman),
              ],
            ),
            Spacer(),

            CustomTextField(hint: widget.username, iconImage: '', controller: profileAndTargetProvider.nameController, label: '', icon: Icons.person,),
            SizedBox(height: 10,),
            CustomTextField(hint: '182.5', iconImage: 'assets/icons/height-svgrepo-com.svg', controller: profileAndTargetProvider.heightController, label: 'Cm', textInputType: TextInputType.number,),
            SizedBox(height: 10,),
            CustomTextField(hint: '80.5', iconImage: 'assets/icons/weight-svgrepo-com.svg', controller: profileAndTargetProvider.widthController, label: 'Kg', textInputType: TextInputType.number,),
            SizedBox(height: 10,),
            CustomTextField(hint: '1986.09.30', iconImage: 'assets/icons/cake-svgrepo-com.svg', controller: profileAndTargetProvider.birthController, label: '', textInputType: TextInputType.datetime,),

            Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Text('Target,', style: titleBig.black87,),
            ),
            Spacer(),

            CustomTextField(hint: '5,000', iconImage: 'assets/icons/walk.svg', controller: profileAndTargetProvider.waterController, label: 'Steps', textInputType: TextInputType.number,),
            SizedBox(height: 10,),
            CustomTextField(hint: '5,000', iconImage: '', icon: Icons.water_drop_outlined, controller: profileAndTargetProvider.walkController, label: 'ml', textInputType: TextInputType.number,),
            Spacer(),
            
            CustomButton(text: 'Complete', function: () async {
              await profileAndTargetProvider.proAndTarTest()
                  ? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen()))
                  : Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen()));
            }),
            Spacer(),
          ],
        ),
      ),
    );
  }

  GestureDetector _genderBox(String gender, IconData icon) {
    return GestureDetector(
      onTap: () {
        profileAndTargetProvider.changeGender(gender);
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.3,
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          border: profileAndTargetProvider.isSelectGender == gender
              ? Border.all(color: Colors.grey, width: 1)
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 55, color: profileAndTargetProvider.isSelectGender == gender
                ? Colors.black
                : Colors.grey,
            ),
            Text(gender, style: profileAndTargetProvider.isSelectGender == gender
                ? bodyMedium.black87
                : bodyMedium.grey,
            ),
          ],
        ),
      ),
    );
  }

}
