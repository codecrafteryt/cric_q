  import 'dart:async';
  import 'package:cric_q/utils/extensions/extentions.dart';
import 'package:cric_q/utils/values/my_color.dart' show MyColors;
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

  class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    _SplashScreenState createState() => _SplashScreenState();
  }

  class _SplashScreenState extends State<SplashScreen> {
    double progress = 0.0;

    @override
    void initState() {
      super.initState();
      _startProgress();
    }

    void _startProgress() {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (progress < 1.0) {
          setState(() {
            progress += 0.05;
          });
        } else {
          timer.cancel();
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) {
              // Get.offAll(() => MenuScreen());
            }
          });
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.white,
                MyColors.green,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              10.sbh,
              Image.asset(
                'assets/images/app_icon.png',
                width: 324.w,
                height: 328.h,
                fit: BoxFit.contain,
              ),
              71.sbh,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: LinearProgressIndicator(
                  minHeight: 7,
                  value: progress,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(63, 218, 104, 1),
                  ),
                  backgroundColor: const Color.fromRGBO(224, 247, 130, 1),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }