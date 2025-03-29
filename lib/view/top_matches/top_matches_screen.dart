import 'package:cric_q/controller/quiz_level_controller.dart';
import 'package:cric_q/utils/extensions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/values/my_color.dart';
import '../../utils/values/style.dart';
import '../../view/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMatchesScreen extends StatelessWidget {
  final QuizLevelController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade900, Colors.green.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 196.w,
                  height: 196.h,
                  fit: BoxFit.contain,
                ),
              ),
              31.sbh,
              SizedBox(
                height: 520.h,
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                  },
                  itemCount: controller.matches.length,
                  itemBuilder: (context, index) {
                    final match = controller.matches[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
                      child: Container(
                        height: 381.h,
                        width: 363.w,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.white, width: 5),
                          borderRadius: BorderRadius.circular(23.r),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                match["image"]!,
                                height: 150.h,
                                width: 270.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            50.sbh,
                            Text(
                              match["title"]!,
                              textAlign: TextAlign.center,
                              style: kSize14DarkW400Text.copyWith(
                                fontSize: 24,
                                color: MyColors.white,
                              ),
                            ),
                            20.sbh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.chevron_left, color: Colors.white, size: 30),
                                  onPressed: controller.previousPage,
                                ),
                                Text(
                                  match["viewers"]!,
                                  style: kSize14DarkW400Text.copyWith(
                                    fontSize: 24,
                                    color: MyColors.white,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.chevron_right, color: Colors.white, size: 30),
                                  onPressed: controller.nextPage,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              31.sbh,
              CustomButton(
                text: "Read",
                height: 64.h,
                width: 193.w,
                textStyle: kSize18DarkW800Text.copyWith(
                  color: MyColors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
                onPressed: controller.openMatchStory,
              ),
              SizedBox(height: 80.h),
              CustomButton(
                text: "Back",
                height: 64.h,
                width: 193.w,
                textStyle: kSize18DarkW800Text.copyWith(
                  color: MyColors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}