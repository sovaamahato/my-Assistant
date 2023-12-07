import 'package:flutter/material.dart';

import '../pallete.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          "My  Assistant ",
          style: TextStyle(fontFamily: "Cera Pro", fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
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
                ]),
                
          ),
          child: Column(children: [Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 35)
                          .copyWith(top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Pallete.borderColor),
                          borderRadius: BorderRadius.circular(20)
                              .copyWith(topLeft: Radius.zero)),
                      // child: Text(
                      //   generatedContent == null
                      //       ? "Good Morning ! what task can i do for you?"
                      //       : generatedContent!,
                      //   style: TextStyle(
                      //       fontFamily: "Cera Pro",
                      //       fontSize: generatedContent == null ? 25 : 18),
                      // ),
                    )]),
          ),
          
    ));
  }
}
