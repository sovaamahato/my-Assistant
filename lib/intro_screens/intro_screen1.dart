import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../pallete.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      //backgroundColor: const Color.fromARGB(255, 199, 235, 246),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: SweepGradient(
                      // center: Alignment.topRight,
                      // radius: 3,
                      colors: [
                    Pallete.color1,
                    Pallete.color2,
                    Pallete.color2,
                    Pallete.color3,
                    //  Pallete.color4,
                    Pallete.color5,
                    Pallete.color6,
                    Pallete.color7,
                    // Pallete.color8,
                    Pallete.color9,

                    //  Pallete.color10,

                    // Pallete.whiteColor,

                    // Pallete.color4,
                    // Pallete.color10,
                    // Pallete.whiteColor,
                  ])),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 60, left: 20, right: 10),
                          child: BounceInDown(
                              child: Image.asset("assets/images/robo.png")),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(28.0),
                          child: Center(
                            child: Text(
                              "Hello, I am ChatGPT , a large language model trained by OpenAI. I can answer questions, generate text, and assist with various tasks . I am a work in progress , so please be patient with me",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
