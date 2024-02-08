import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:my_assistant/pallete.dart';
import 'package:my_assistant/utils/enum_home_type.dart';
import 'package:my_assistant/utils/ad_helper.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    //only for testing in developing phase
    Animate.restartOnHotReload = true;

    Size mq = MediaQuery.of(context).size;
    return Card(
      color: const Color.fromARGB(255, 145, 174, 243),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: InkWell(
        //for ads
        // onTap: () => AdHelper.showInterstitialAd(homeType.onTap),
        onTap: homeType.onTap,
        borderRadius: BorderRadius.circular(20),
        child: homeType.leftAlign
            ? Row(
                children: [
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    child: Lottie.asset(
                      'assets/lottie/${homeType.lottie}',
                    ),
                  ),
                  const Spacer(),
                  Text(
                    homeType.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              )
            : Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    homeType.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    child: Lottie.asset(
                      'assets/lottie/${homeType.lottie}',
                    ),
                  ),
                  const Spacer(),
                ],
              ),
      ),
    ).animate().scale(duration: 1.seconds, curve: Curves.easeIn);
  }
}
