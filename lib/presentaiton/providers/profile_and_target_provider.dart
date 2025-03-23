import 'package:flutter/cupertino.dart';

import '../../data/repositories/auth_repository.dart';

final ProfileAndTargetProvider profileAndTargetProvider = ProfileAndTargetProvider();

class ProfileAndTargetProvider extends ChangeNotifier {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController birthController = TextEditingController();

  final TextEditingController walkController = TextEditingController();
  final TextEditingController waterController = TextEditingController();

  String isSelectGender = '';

  bool isProAndTarError = false;

  Future<bool> proAndTarTest() async {
    print('왜 안나옴');
    print(isSelectGender[0]);
    if (await authRepository.proAndTar(
        isSelectGender[0],
        nameController.text,
        double.parse(widthController.text),
        double.parse(heightController.text),
        birthController.text,
        int.parse(waterController.text),
        int.parse(walkController.text)) == true) {
      print('잉');
      return true;
    }
    print('잉dld');
    isProAndTarError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isProAndTarError = false;
    notifyListeners();
    return false;
  }

  void changeGender(String gender) {
    isSelectGender = gender;
    notifyListeners();
  }

}