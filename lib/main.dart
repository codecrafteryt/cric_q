  /*
      ---------------------------------------
      Project: Plinkos Puzzle Game Mobile Application
      Date: March 29, 2024
      Author: Ameer from Pakistan
      ---------------------------------------
      Description: Main.dart file is a entry file
    */

  import 'package:cric_q/view/menu/splash_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get_navigation/src/root/get_material_app.dart';
  import 'package:get/get_navigation/src/routes/transitions_type.dart';

  import 'data/helper/get_di.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    DependencyInjection.init();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(const MyApp());
    });
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return ScreenUtilInit(
          designSize: const Size(375, 880),
          minTextAdapt: false,
          splitScreenMode: false,
          builder: (_, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.leftToRight,
              home: const SplashScreen(),
            );
          });
    }
  }
