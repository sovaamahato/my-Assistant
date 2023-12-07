import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:my_assistant/pages/home_page2.dart';

import '../pallete.dart';


class HiddenDrawre extends StatefulWidget {
  const HiddenDrawre({Key? key}) : super(key: key);

  @override
  State<HiddenDrawre> createState() => _HiddenDrawreState();
}

class _HiddenDrawreState extends State<HiddenDrawre> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "SparkyBot",
              baseStyle: TextStyle(),
              selectedStyle: TextStyle()),
          HomePage2())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        screens: _pages, backgroundColorMenu: Pallete.firstSuggestionBoxColor,initPositionSelected: 0,);
  }
}