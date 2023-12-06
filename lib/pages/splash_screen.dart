import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_assistant/pages/onboarding_screen.dart';
import 'package:my_assistant/pallete.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const OnBoardingScreen();
      }));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Pallete.gradientBlue,
        Pallete.whiteColor,
      ])),
        child: Center(
            child: Column(
          children: [
            const Spacer(),
           LottieBuilder.asset("assets/images/animation.json"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            const Text(
              'made by : U&S',
              style: TextStyle(color: Colors.black, fontFamily: 'sans_semibold'),
            ),
            const SizedBox(height: 30,)
          ],
        )),
      ),
    );
  }
}
