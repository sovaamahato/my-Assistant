
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_assistant/feature_box.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final speechToText=SpeechToText();

   String lastWords='';

   void initState() {
    super.initState();
    initTextToSpeech();
  }

  /// This has to happen only once per app
  Future <void> initTextToSpeech() async {
    await speechToText.initialize();
    setState(() {});
  }
  Future <void> startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

 
Future <void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }


  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

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
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
          ),
          title: const Text(
            "My  Assistant ",
            style: TextStyle(fontFamily: "Cera Pro", fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // assistant image
      
            Stack(
              children: [
                Center(
                    child: Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle),
                )),
                Container(
                  height: 129,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                      "assets/images/voiceAssistant.png",
                    ),),
                  ),
                ),
              ],
            ),
      
            //chat bubble
            
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 35).copyWith(top: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Pallete.borderColor),
                    borderRadius:
                        BorderRadius.circular(20).copyWith(topLeft: Radius.zero)),
                child: const Text(
                  "Good Morning ! what task can i do for you?",
                  style: TextStyle(),
                ),
              
            ),
      
            //here are new features text
      
         
             Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Here are new features",
                    style: TextStyle(
                        fontFamily: "Cera Pro",
                        fontSize: 20,
                        color: Pallete.mainFontColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              
            ),
            // //features box 2ota
            const FeatureBox(
                headerText: "Chat GPT",
                descriptionText: "A smarter way to stay organized with chat GPT",
                color: Pallete.firstSuggestionBoxColor),
      
            const FeatureBox(
                headerText: "Voice Assistant ",
                descriptionText:
                    "Get the best of worlds with a voice assistant powered by ChatGpt.",
                color: Pallete.secondSuggestionBoxColor),
                
const Spacer(),      
            //textfield
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Pallete.assistantCircleColor),
              child: Row(children: [
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Message", border: InputBorder.none),
                  ),
                )),
                GestureDetector(onTap:()async{
                  if(await speechToText.hasPermission && speechToText.isNotListening){
                    await startListening();
                  }else if(speechToText.isListening){
                    print(lastWords);
                  }

                } ,child:const Icon(Icons.mic)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
              ]),
            )
          ],
        )),
      ),
    );
  }
}
