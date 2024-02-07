import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AssistantImgAnimation extends StatelessWidget {
  const AssistantImgAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // Center(
            //   child: Container(
            //     height: 120,
            //     width: 120,
            //     decoration: const BoxDecoration(
            //         color: Pallete.assistantCircleColor,
            //         shape: BoxShape.circle),
            //   ),
            // ),
            Center(
                child: LottieBuilder.asset(
              "assets/images/circle.json",
              height: 189,
            )),
            Positioned(
              child: Container(
                height: 149,
                decoration: const BoxDecoration(
                  //shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/voiceAssistant.png",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
