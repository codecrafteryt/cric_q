import 'package:cric_q/controller/quiz_level_controller.dart';
import 'package:cric_q/utils/extensions/extentions.dart';
import 'package:cric_q/utils/values/my_color.dart';
import 'package:cric_q/utils/values/style.dart';
import 'package:cric_q/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Quiz4Screen extends StatelessWidget {
  final QuizLevelController quizController = Get.find();
  @override
  Widget build(BuildContext context) {
    if (quizController.questions.isEmpty) {
      quizController.loadQuestionsForLevel(4);
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightGreen,
              MyColors.green,
              Colors.green.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Obx(() {
          final question = quizController.questions[quizController.currentQuestionIndex.value];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors.white,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    question.question,
                    style: kSize14DarkW400Text.copyWith(
                        fontSize: 30.sp,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(question.options.length, (index) {
                return GestureDetector(
                  onTap: () {
                    quizController.selectedAnswer.value = index;
                  },
                  child: Container(
                    width: 393.w,
                    height: 80.h,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: MyColors.btnColor,
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(
                        color: quizController.selectedAnswer.value == index
                            ? Color.fromRGBO(123, 239, 132, 1)
                            : Colors.grey[200] ?? Colors.grey,
                        width: 5,
                      ),
                    ),
                    child: Text(
                        textAlign: TextAlign.center,
                        question.options[index],
                        style: kSize18DarkW800Text.copyWith(
                            fontSize: 20.sp,
                            color: MyColors.white
                        )
                    ),
                  ),
                );
              }),
              20.sbh,
              CustomButton(
                text: "Next",
                height: 64.h,
                width: 193.w,
                textStyle: kSize18DarkW800Text.copyWith(
                  color: MyColors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
                onPressed: quizController.selectedAnswer.value == -1 ? () {} : quizController.nextQuestion,
                backgroundColor: quizController.selectedAnswer.value == -1
                    ? MyColors.btnColor
                    : MyColors.green,
              ),

            ],
          );
        }),
      ),
    );
  }
}
