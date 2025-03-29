import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cric_q/utils/values/my_color.dart';
import 'package:cric_q/utils/values/style.dart';
import 'package:cric_q/view/widgets/custom_button.dart';
import 'package:cric_q/utils/extensions/extentions.dart';

import '../../controller/quiz_selection_controller.dart';

class QuizSelectionScreen extends StatelessWidget {
  const QuizSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final QuizSelectionController controller = Get.put(QuizSelectionController());

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
            // Logo Container
            Image.asset(
              'assets/images/logo.png',
              width: 324.w,
              height: 328.h,
              fit: BoxFit.contain,
            ),
            68.sbh,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Obx(() => Column(
                children: [
                  CustomButton(
                    text: "QUIZ 1",
                    height: 64.h,
                    width: 255.w,
                    textStyle: kSize18DarkW800Text.copyWith(
                      color: MyColors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onPressed: controller.quizUnlocked[0]
                        ? () => controller.navigateToQuiz(1)
                        : () {},
                    backgroundColor: controller.quizUnlocked[0]
                        ? MyColors.btnColor
                        : Colors.grey,

                  ),
                  7.sbh,
                  CustomButton(
                    text: "QUIZ 2",
                    height: 64.h,
                    width: 255.w,
                    textStyle: kSize18DarkW800Text.copyWith(
                      color: MyColors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onPressed: controller.quizUnlocked[1]
                        ? () => controller.navigateToQuiz(2)
                        : () {},
                    backgroundColor: controller.quizUnlocked[1]
                        ? MyColors.btnColor
                        : Colors.transparent,
                  ),
                  7.sbh,
                  CustomButton(
                    text: "QUIZ 3",
                    height: 64.h,
                    width: 255.w,
                    textStyle: kSize18DarkW800Text.copyWith(
                      color: MyColors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onPressed: controller.quizUnlocked[2]
                        ? () => controller.navigateToQuiz(3)
                        : () {},
                    backgroundColor: controller.quizUnlocked[2]
                        ? MyColors.btnColor
                        : Colors.transparent,
                  ),
                  7.sbh,
                  CustomButton(
                    text: "QUIZ 4",
                    height: 64.h,
                    width: 255.w,
                    textStyle: kSize18DarkW800Text.copyWith(
                      color: MyColors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onPressed: controller.quizUnlocked[3]
                        ? () => controller.navigateToQuiz(4)
                        : () {},
                    backgroundColor: controller.quizUnlocked[3]
                        ? MyColors.btnColor
                        : Colors.transparent,
                  ),
                  70.sbh,
                  CustomButton(
                    text: "Back",
                    height: 64.h,
                    width: 193.w,
                    textStyle: kSize18DarkW800Text.copyWith(
                      color: MyColors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}