import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_a_practice3/common/fonts.dart';
import 'package:module_a_practice3/presentaiton/providers/main_provider.dart';
import 'package:module_a_practice3/presentaiton/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.tkn});

  final String tkn;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    mainProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('tkn:  ${widget.tkn}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('MY Health DATA', style: bodyBold.white,),
          actions: [
            Stack(
              children: [
                Icon(Icons.more_vert, color: Colors.white,),
                Positioned(child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ), top: 0, right: 5,),
              ],
            ),
            SizedBox(width: 10,)
          ],
        ),
        body: PageView(
          controller: mainProvider.pageController,
          children: [
            HomeScreen(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainProvider.currentIndex,
          onTap: (index) => {
            mainProvider.moveScreen(index),
          },
            items: [
          BottomNavigationBarItem(icon: SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/icons/home-1-svgrepo-com.svg',
              colorFilter: ColorFilter.mode(mainProvider.currentIndex == 0 ? Colors.white : Colors.grey, BlendMode.srcIn),
            ),
          ), label: 'Home'),
          BottomNavigationBarItem(icon: SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/icons/alarm-clock-svgrepo-com.svg',
              colorFilter: ColorFilter.mode(mainProvider.currentIndex == 1 ? Colors.white : Colors.grey, BlendMode.srcIn),
            ),
          ), label: 'Home'),
          BottomNavigationBarItem(icon: SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/icons/run-on-treadmill-exercise-work-out-run-svgrepo-com.svg',
              colorFilter: ColorFilter.mode(mainProvider.currentIndex == 2 ? Colors.white : Colors.grey, BlendMode.srcIn),
            ),
          ), label: 'Home'),
          BottomNavigationBarItem(icon: SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/icons/user-svgrepo-com.svg',
              colorFilter: ColorFilter.mode(mainProvider.currentIndex == 3 ? Colors.white : Colors.grey, BlendMode.srcIn),
            ),
          ), label: 'Home'),
        ]),
      ),
    );
  }
}
