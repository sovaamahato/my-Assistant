
import 'package:flutter/material.dart';
import 'package:my_assistant/feature_box.dart';

import '../pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
            ]),
          )
        ],
      )),
    );
  }
}
