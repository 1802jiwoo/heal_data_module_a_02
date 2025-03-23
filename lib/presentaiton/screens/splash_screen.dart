import 'package:flutter/material.dart';
import 'package:module_a_practice3/common/fonts.dart';
import 'package:module_a_practice3/presentaiton/providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashProvider.addListener(updateScreen);
      splashProvider.startAnimation(context);
    },);
  }

  @override
  void dispose() {
    splashProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: splashProvider.isLogoAnimation ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Image.asset(
                'assets/images/symbol.png',
                width: MediaQuery.sizeOf(context).width * 0.38,
              ),
            ),
            splashProvider.isLogoAnimation ? AnimatedSlide(
              offset: Offset(0, splashProvider.isTextAnimation ? 0 : 1),
              duration: Duration(seconds: 1),
              child: Text('MY Health DATA', style: titleBold.black),
            ) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
