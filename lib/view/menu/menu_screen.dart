/*
    ---------------------------------------
    Project: Plinkos Puzzle Game Mobile Application
    Date: March 29, 2024
    Author: Ameer from Pakistan
    ---------------------------------------
    Description: here all custom colors
  */
  import 'package:cric_q/utils/extensions/extentions.dart';
import 'package:cric_q/utils/values/style.dart';
import 'package:cric_q/view/widgets/custom_button.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
  import '../../utils/values/my_color.dart' show MyColors;
import '../quiz/quiz_selection_screen.dart';
import '../top_matches/top_matches_screen.dart';
  class MenuScreen extends StatelessWidget {
    const MenuScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightGreenAccent,
                MyColors.green,
                Colors.green.shade900,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 324.w,
                height: 328.h,
                fit: BoxFit.contain,
              ),
              68.sbh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    CustomButton(
                      text: "QUIZ",
                      height: 64.h,
                      width: 255.w,
                      textStyle: kSize18DarkW800Text.copyWith(
                        color: MyColors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      onPressed: (){
                        Get.to(() => QuizSelectionScreen(),);
                      },
                    ),
                    14.sbh,
                    CustomButton(
                      text: "Top 5 Matches",
                      height: 64.h,
                      width: 255.w,
                      textStyle: kSize18DarkW800Text.copyWith(
                        color: MyColors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      onPressed: (){
                        Get.to(() => TopMatchesScreen(),);
                      },
                    ),
                    60.sbh,
                    CustomButton(
                      text: "Options",
                      height: 64.h,
                      width: 139.w,
                      textStyle: kSize18DarkW800Text.copyWith(
                        color: MyColors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
