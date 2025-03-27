import 'package:flutter/material.dart';
import 'package:module_a_practice3/common/fonts.dart';
import 'package:module_a_practice3/presentaiton/screens/main_screen.dart';
import 'package:module_a_practice3/presentaiton/screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        selectedLabelStyle: bodyMedium.white,
        unselectedLabelStyle: bodyMedium.grey,
      )
    ),
    home: SplashScreen(),
    // home: MainScreen(tkn: '123456'),
    debugShowCheckedModeBanner: false,
  ));
}

