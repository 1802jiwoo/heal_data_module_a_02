import 'package:flutter/cupertino.dart';

final ProfileAndTargetProvider profileAndTargetProvider = ProfileAndTargetProvider();

class ProfileAndTargetProvider extends ChangeNotifier {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController birthController = TextEditingController();

  final TextEditingController walkController = TextEditingController();
  final TextEditingController waterController = TextEditingController();

  String isSelectGender = '';

  void changeGender(String gender) {
    isSelectGender = gender;
    notifyListeners();
  }

}