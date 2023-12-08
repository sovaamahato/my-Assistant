import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../openai_services.dart';
import '../pallete.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final speechToText = SpeechToText();

  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();

  final FlutterTts flutterTts = FlutterTts();
  bool isLoading = false;

  TextEditingController textController = TextEditingController();
  bool isSpeechGenerated = false;
  String? generatedContent;
  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
     isSpeechGenerated = false;
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  //to make system tospeak
  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  Future<void> systemDontSpeak(String content) async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   leading: const Icon(
      //     Icons.menu,
      //   ),
      //   title: const Text(
      //     "My  Assistant ",
      //     style: TextStyle(fontFamily: "Cera Pro", fontWeight: FontWeight.bold),
      //   ),
      // ),
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
              ]),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Positioned.fill(
              //     top: -600,
              //     right: 0,
              //     bottom: 0,
              //     left: 0,
              //     child: LottieBuilder.asset(
              //       "assets/images/T.json",
              //     )),

              Positioned.fill(
                  top: -500,
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
              Column(children: [
                // const SizedBox(
                //   height: 60,
                // ),
                // assistant image

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
                const SizedBox(
                  height: 20,
                ),

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 35)
                      .copyWith(top: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Pallete.borderColor),
                      borderRadius: BorderRadius.circular(20)
                          .copyWith(topLeft: Radius.zero)),
                  child: Text(
                    generatedContent == null
                        ? "Hello ! what task can i do for you?"
                        : generatedContent!,
                    style: TextStyle(
                        color: Pallete.whiteColor,
                        fontFamily: "Cera Pro",
                        fontSize: generatedContent == null ? 25 : 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                

                //textfield
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Pallete.secondSuggestionBoxColor),
                    child: Row(children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: textController,
                          decoration: const InputDecoration(
                              hintText: "Message", border: InputBorder.none),
                        ),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                if (await speechToText.hasPermission &&
                                    speechToText.isNotListening) {
                                  await startListening();
                                } else if (speechToText.isListening) {
                                  
                                  final speech =
                                      await openAIService.chatGPTAPI(lastWords);
                                
                            await systemSpeak(speech);
                          

                          generatedContent = speech;
                          isSpeechGenerated = true;

                          setState(() {});
                                  await stopListening();
                                } else {
                                   isSpeechGenerated = false;
                                  initSpeechToText();
                                }
                              },
                              child: speechToText.isListening
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.stop,
                                        size: 35,
                                      ),
                                    )
                                  : const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.mic,
                                        size: 35,
                                      ),
                                    )),
                          GestureDetector(
                              onTap: () async {
                                isLoading = true;
                              try{
                                final speech = await openAIService
                                    .chatGPTAPI(textController.text);

                                await systemSpeak(speech);

                                generatedContent = speech;
                                textController.clear();
                              }catch(e) {
                                //
                              }finally{
                                isLoading = false;
                              }

                                setState(() {});
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(
                                  Icons.send,
                                  size: 35,
                                  color: Colors.black,
                                ),
                              )),

                              Visibility(
                                visible: isLoading==true,
                                child: Container(child:CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.blue),
                            ) ,))
                    //           Container(
                    //   child: isLoading
                    //       ? CircularProgressIndicator(
                    //           valueColor: AlwaysStoppedAnimation(Colors.blue),
                    //         )
                    //       : Text(generatedContent!)
                    // ),
                        ],
                      )
                    ]),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    ));
  }
}
