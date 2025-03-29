import 'package:cric_q/controller/quiz_level_controller.dart';
import 'package:cric_q/utils/extensions/extentions.dart';
import 'package:cric_q/utils/values/my_color.dart';
import 'package:cric_q/utils/values/style.dart';
import 'package:cric_q/view/menu/menu_screen.dart';
import 'package:cric_q/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Quiz1ResultScreen extends StatelessWidget {
  final QuizLevelController controller = Get.find();

  /// Load quiz score from SharedPreferences
  Future<int> loadQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('quiz_score') ?? 0; // Default to 0 if no value is stored
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.onClose();
        return true;
      },
      child: Scaffold(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 324.w,
                    height: 328.h,
                    fit: BoxFit.contain,
                  ),
                ),
                FutureBuilder<int>(
                  future: loadQuizResult(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    int quizScore = snapshot.data!;
                    return Container(
                      width: 363.w,
                      height: 381.h,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.41),
                        borderRadius: BorderRadius.circular(23.r),
                        border: Border.all(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 5,
                        ),
                      ),
                      child: Column(
                        children: [
                          5.sbh,
                          Text(
                            "End",
                            textAlign: TextAlign.center,
                            style: kSize14DarkW400Text.copyWith(
                              fontSize: 40.sp,
                              color: Colors.white,
                            ),
                          ),
                          5.sbh,
                          Text(
                            controller.correctAnswersCount == 5 ? "Quiz 2 open" : "Quiz 2 not open",
                            textAlign: TextAlign.center,
                            style: kSize14DarkW400Text.copyWith(
                              fontSize: 40.sp,
                              color: Colors.white,
                            ),
                          ),
                          5.sbh,
                          Text(
                            "Right answer:\n ${controller.correctAnswersCount} / 5",
                            textAlign: TextAlign.center,
                            style: kSize14DarkW400Text.copyWith(
                              fontSize: 35.sp,
                              color: Colors.white,
                            ),
                          ),
                          5.sbh,
                        ],
                      ),
                    );
                  },
                ),
                20.sbh,
                CustomButton(
                  text: "Menu",
                  height: 64.h,
                  width: 139.w,
                  backgroundColor: MyColors.btnColor,
                  textStyle: kSize18DarkW800Text.copyWith(
                    color: MyColors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  onPressed: () {
                    Get.to(() => MenuScreen());
                    controller.onClose();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
