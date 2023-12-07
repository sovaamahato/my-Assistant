import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:my_assistant/pages/home_page.dart';
import 'package:my_assistant/pages/home_page2.dart';

import '../pallete.dart';
import 'about_us.dart';

class HiddenDrawre extends StatefulWidget {
  const HiddenDrawre({Key? key}) : super(key: key);

  @override
  State<HiddenDrawre> createState() => _HiddenDrawreState();
}

class _HiddenDrawreState extends State<HiddenDrawre> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Landing Page ",
              baseStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              selectedStyle: const TextStyle(fontSize: 20)),
          const HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "home page 2",
              baseStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              selectedStyle: const TextStyle()),
          const HomePage2()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "About Us",
              baseStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              selectedStyle: const TextStyle()),
          const AboutUs()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.deepPurple.shade200,
      initPositionSelected: 0,
      backgroundColorAppBar: Colors.deepPurple.shade200,
    );
  }
}
