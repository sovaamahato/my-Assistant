import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:my_assistant/pages/landin_page.dart';
import 'package:my_assistant/pages/feature/sparky_bot.dart';
import 'package:my_assistant/pallete.dart';

import '../pages/about_us.dart';

class HiddenDrawre extends StatefulWidget {
  const HiddenDrawre({Key? key}) : super(key: key);

  @override
  State<HiddenDrawre> createState() => _HiddenDrawreState();
}

class _HiddenDrawreState extends State<HiddenDrawre> {
  List<ScreenHiddenDrawer> _pages = [];
  int selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Landing Page ",
            baseStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Pallete.whiteColor,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              color: Pallete.whiteColor,
            ),
            colorLineSelected: Colors.deepPurple.shade300,
          ),
          const LandinPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Sparky Bot",
            baseStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Pallete.whiteColor,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              color: Pallete.whiteColor,
            ),
            colorLineSelected: Colors.deepPurple.shade300,
          ),
          const SparkyBot()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "About Us",
            baseStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Pallete.whiteColor,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              color: Pallete.whiteColor,
            ),
            colorLineSelected: Colors.deepPurple.shade300,
          ),
          const AboutUs()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.deepPurple.shade200,
      backgroundColorAppBar: Colors.deepPurple.shade200,
      backgroundColorContent: Colors.white,
      initPositionSelected: selectedPageIndex,
      // backgroundColorSelectedMenu: Colors.deepPurple.shade300,
      //  screenSelectedBuilder: (position, controller) {
      //   setState(() {
      //     selectedPageIndex = position; // Update the selected page index
      //   });
      //   controller.toggle(); // Close the drawer after selecting a screen
      // },
    );
  }
}
