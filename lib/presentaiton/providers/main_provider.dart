import 'package:flutter/cupertino.dart';

final MainProvider mainProvider = MainProvider();

class MainProvider extends ChangeNotifier {

  final PageController pageController = PageController();
  int currentIndex = 0;

  String userName = 'Competitor99';
  String gender = 'M';
  double height = 182.5;
  double weight = 80.5;
  double bmi = 0.0;

  int targetSteps = 5000;
  int nowSteps = 2652;
  double lastHeartRate = 118;
  double minHeartRate = 60;
  double maxHeartRate = 120;

  int nowWater = 250;
  int targetWater = 2000;

  void moveScreen(int index) {
    currentIndex = index;
    pageController.jumpToPage(currentIndex);
    notifyListeners();
  }

  void setBmi() {
    bmi = ((weight / ((height / 100) * (height / 100))) * 100).round() / 100;
    notifyListeners();
  }

}