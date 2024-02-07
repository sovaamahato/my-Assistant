import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_assistant/pages/startup_pages/splash_screen.dart';
import 'package:my_assistant/utils/pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init hive
  await Pref.initialize();
  //making app full screen
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      // .copyWith(
      //   //scaffoldBackgroundColor: Pallete.whiteColor,
      // ),
      home: const SplashScreen(),
    );
  }
}
