import 'package:flutter/material.dart';
import 'package:my_assistant/intro_screens/intro_screen1.dart';
import 'package:my_assistant/intro_screens/intro_screen2.dart';
import 'package:my_assistant/intro_screens/intro_screen3.dart';
import 'package:my_assistant/widgets/hidden_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track of which page we are on
  final PageController _controller = PageController();

  //keep track of if we are in the last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Creates a scrollable list that works page by page from an explicit [List] of widgets.

          PageView(
            //  physics: onLastPage ? const NeverScrollableScrollPhysics() : null,
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              // Container(
              //   color: Colors.blue,
              // ),
              // Container(
              //   color: Colors.yellow,
              // ),
              // Container(
              //   color: Colors.green,
              // ),

              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          
          //dot indicators
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(2);
                      },
                      child: Container(
                          // color: Colors.transparent,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 145, 174, 243),
                              borderRadius: BorderRadius.circular(95)),
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text('skip'),
                          ))),
                  SmoothPageIndicator(controller: _controller, count: 3),

                  //next
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                //return const HomePage();
                                return const HiddenDrawre();
                              },
                            ));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 145, 174, 243),
                              borderRadius: BorderRadius.circular(95)),
                              child: const Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Text('Done'),
                              )))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                             decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 145, 174, 243),
                              borderRadius: BorderRadius.circular(95)),
                              child: const Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Text('next'),
                              ))),
                ],
              )),
        ],
      ),
    );
  }
}
