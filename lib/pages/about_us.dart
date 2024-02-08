import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pallete.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
                  // Pallete.color10,)
                ]),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 65, 89, 144),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.96,
                    child: Column(
                      children: [
                        const Text(
                          'Developed by',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Upasana \nKhatiwada',
                                  style: TextStyle(color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final Uri url = Uri.parse(
                                        'https://github.com/upasana-khatiwada');
                                    launchUrl(url);
                                  },
                                  child: Image.asset(
                                    'assets/images/GitHub-Symbol.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sova\n Kushwaha',
                                  style: TextStyle(color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final Uri url = Uri.parse(
                                        'https://github.com/sovaamahato');
                                    launchUrl(url);
                                  },
                                  child: Image.asset(
                                    'assets/images/GitHub-Symbol.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.deepPurple,
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Developed using flutter. \n SparkyBot\n Version 1.0.1",
                  style: TextStyle(
                      color: Color.fromARGB(255, 56, 19, 19), fontSize: 15),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.deepPurple,
                    thickness: 2,
                  ),
                ),
                const Spacer(),
              ],
            ),
          )),
    );
  }
}
