import 'package:flutter/material.dart';

import '../pallete.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //  backgroundColor: const Color.fromARGB(255, 199, 235, 246),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        center: Alignment.topRight,
                        radius: 3,
                        colors: [
                      // Pallete.color1,
                      Pallete.color2,
                      //  Pallete.color2,
                      Pallete.color3,
                      //  Pallete.color4,
                      Pallete.color5,
                      //   Pallete.color6,
                      Pallete.color7,
                      // Pallete.color8,
                      Pallete.color9,

                      //  Pallete.color10,

                      // Pallete.whiteColor,

                      // Pallete.color4,
                      // Pallete.color10,
                      // Pallete.whiteColor,
                    ])),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 10),
                          child: Image.asset("assets/images/robo2.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(28.0),
                          child: Text(
                            "To use ChatGPT, you can simply ask it a question or give it a prompt and it will generate a response. For example ask it a question like \"What is the capital of Nepal ?\" or give it a prompt like \"Write a poem on Flutter\".",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
