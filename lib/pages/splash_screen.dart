import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_assistant/pages/home_page.dart';
import 'package:my_assistant/pages/onboarding_screen.dart';
import 'package:my_assistant/pallete.dart';
import 'package:my_assistant/utils/pref.dart';
import 'package:my_assistant/widgets/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //   return Pref.showOnboarding
      //       ? const OnBoardingScreen()
      //       : const HomePage();
      // }));

      Get.off(() =>
          Pref.showOnboarding ? const OnBoardingScreen() : const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                transform: GradientRotation(3),
                center: Alignment.topRight,
                radius: 3,
                // tileMode: TileMode.clamp,
                colors: [
              //  Pallete.color1,
              Pallete.color2,
              // Pallete.color2,
              Pallete.color3,
              //  Pallete.color4,
              Pallete.color5,
              Pallete.color6,
              //  Pallete.color7,
              // Pallete.color8,
              Pallete.color9,

              //  Pallete.color10,

              // Pallete.whiteColor,

              // Pallete.color4,
              // Pallete.color10,
              // Pallete.whiteColor,
            ])),
        child: Center(
            child: Column(
          children: [
            const Spacer(flex: 2),
            LottieBuilder.asset("assets/images/animation.json"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Version 1.0.1",
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            //lottie loading
            const CustomLoading(),
            const Text(
              'made by : U&S',
              style:
                  TextStyle(color: Colors.white, fontFamily: 'sans_semibold'),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }
}
