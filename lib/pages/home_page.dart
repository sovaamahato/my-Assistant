import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:my_assistant/feature_box.dart';

import '../pallete.dart';
import 'home_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // when user want to close the app
  void showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this Application?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pop(context);
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        showBackDialog();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
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
                ])),
            child: SingleChildScrollView(
                child: Stack(
              children: [
                Positioned.fill(
                    top: -400,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/wave.png",
                      fit: BoxFit.cover,
                      // width: MediaQuery.of(context)
                      //     .size
                      //     .width, // Set the width to the screen width
                      // height: MediaQuery.of(context).size.height,
                      //alignment: Alignment.topRight,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //chat bubble
                    SizedBox(height: 70,),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 35)
                          .copyWith(top: 10),
                      decoration: BoxDecoration(
                          //border: Border.all(color: Pallete.borderColor),
                          borderRadius: BorderRadius.circular(20)
                              .copyWith(topLeft: Radius.zero)),
                      child: const Text(
                        "Hello ! what task can i do for you?",
                        style: TextStyle(
                            fontFamily: "Cera Pro",
                            fontSize: 25,
                            color: Pallete.whiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //here are new features text

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Here are new features",
                          style: TextStyle(
                              fontFamily: "Cera Pro",
                              fontSize: 20,
                              color: Pallete.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // //features box 2ota
                    FeatureBox(
                        headerText: "Chat GPT",
                        descriptionText:
                            "A smarter way to stay organized with chat GPT",
                        color: Pallete.secondSuggestionBoxColor),
                    FeatureBox(
                        headerText: "Voice Assistant ",
                        descriptionText:
                            "Get the best of worlds with a voice assistant powered by ChatGpt.",
                        color: Pallete.secondSuggestionBoxColor),
                    // const SizedBox(
                    //   height: 20,
                    // ),

                    //try now button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage2(),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          LottieBuilder.asset(
                            "assets/images/button.json",
                            width: 500,
                            height: 300,
                          ),
                          Positioned(
                            top: 130,
                            left: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "Try Now",
                              style: TextStyle(
                                fontFamily: "Cera Pro",
                                fontSize: 25,
                                color: Pallete.firstSuggestionBoxColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                    //textfield
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: Pallete.assistantCircleColor),
                    //   child: Row(children: [
                    //     Expanded(
                    //         child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: TextField(
                    //         controller: textController,
                    //         decoration: const InputDecoration(
                    //             hintText: "Message", border: InputBorder.none),
                    //       ),
                    //     )),
                    //     GestureDetector(
                    //         onTap: () async {
                    //           if (await speechToText.hasPermission &&
                    //               speechToText.isNotListening) {
                    //             await startListening();
                    //           } else if (speechToText.isListening) {
                    //             final speech =
                    //                 await openAIService.chatGPTAPI(lastWords);
                    //             await systemSpeak(speech);
                    //             // print(lastWords);
                    //             generatedContent = speech;
                    //             setState(() {});
                    //             await stopListening();
                    //           }else{
                    //             initSpeechToText();
                    //           }
                    //         },
                    //         child: const Icon(Icons.mic)),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         final speech =
                    //             await openAIService.chatGPTAPI(textController.text);
                    //         await systemSpeak(speech);
                    //         generatedContent = speech;
                    //         textController.clear();

                    //         setState(() {});
                    //       },
                    //       child: const Padding(
                    //         padding: EdgeInsets.all(14.0),
                    //         child:  Icon(
                    //           Icons.send,
                    //           size: 35,
                    //           color: Colors.black,
                    //         ),)
                    //       ),
                    //   ]),
                    // )
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
