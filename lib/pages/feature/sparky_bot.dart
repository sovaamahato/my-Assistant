import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:my_assistant/controller/chat_controller.dart';
import 'package:my_assistant/widgets/assistant_img_animation.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../openai_services.dart';
import '../../pallete.dart';

class SparkyBot extends StatefulWidget {
  const SparkyBot({super.key});

  @override
  State<SparkyBot> createState() => _SparkyBotState();
}

class _SparkyBotState extends State<SparkyBot> {
  final speechToText = SpeechToText();

  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();

  final FlutterTts flutterTts = FlutterTts();
  bool isLoading = false;

  bool isSpeechGenerated = false;
  String? generatedContent;

  final textController = Get.put(ChatController());
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.purple,
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                transform: GradientRotation(3),
                center: Alignment.topRight,
                radius: 3,
                // tileMode: TileMode.clamp,
                colors: [
              Pallete.color1,
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
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const AssistantImgAnimation(),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    //----------------------------------paxadi ko wave------------
                    // Positioned.fill(
                    //     top: -500,
                    //     right: 0,
                    //     bottom: 0,
                    //     left: 0,
                    //     child: Image.asset(
                    //       "assets/images/wave.png",
                    //       fit: BoxFit.cover,
                    //       // width: MediaQuery.of(context)
                    //       //     .size
                    //       //     .width, // Set the width to the screen width
                    //       // height: MediaQuery.of(context).size.height,
                    //       //alignment: Alignment.topRight,
                    //     )),
                    Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //--answer display hune bubble------------------------
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
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

                      //----------------------------textfield to write questions-------------------

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
                                controller: textController.chatController,
                                decoration: const InputDecoration(
                                    hintText: "Message",
                                    border: InputBorder.none),
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
                                        final speech = await openAIService
                                            .chatGPTAPI(lastWords);

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
                                              color: Colors.deepPurple,
                                              size: 35,
                                            ),
                                          )
                                        : const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.mic,
                                              color: Colors.deepPurple,
                                              size: 35,
                                            ),
                                          )),
                                GestureDetector(
                                    onTap: () async {
                                      isLoading = true;
                                      try {
                                        final speech = await openAIService
                                            .chatGPTAPI(textController
                                                .chatController.text);

                                        await systemSpeak(speech);

                                        generatedContent = speech;
                                        textController.chatController.clear();
                                      } catch (e) {
                                        //
                                      } finally {
                                        isLoading = false;
                                      }

                                      setState(() {});
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Icon(
                                        Icons.send,
                                        size: 35,
                                        color: Colors.deepPurple,
                                      ),
                                    )),

                                Visibility(
                                    visible: isLoading == true,
                                    child: const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.blue),
                                    ))
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
            ],
          ),
        ),
      ),
    );
  }
}
