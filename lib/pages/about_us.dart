import 'package:flutter/material.dart';

import '../pallete.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration:const BoxDecoration(
        gradient: RadialGradient(transform: GradientRotation(3),
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
                  // Pallete.color10,)
      ]),),
      child: Center(child: Text("About us screen"))),);
  }
}