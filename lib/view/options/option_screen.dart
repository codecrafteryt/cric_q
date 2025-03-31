  import 'package:cric_q/controller/option_controller.dart';
  import 'package:cric_q/utils/extensions/extentions.dart';
  import 'package:cric_q/utils/values/my_color.dart';
  import 'package:cric_q/utils/values/style.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';

  class OptionPopup {
    static void showOptionPopup(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          final OptionController controller = Get.find();
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: 350.w,
              height: 250.h,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 0.87),
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: MyColors.white,
                  width: 5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Header Row (Close Button + Title)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.clear,
                          color: MyColors.white,
                          size: 45,
                        ),
                      ),
                      30.sbw,
                      Text(
                        "Options",
                        style: kSize14DarkW400Text.copyWith(
                          fontSize: 32.sp,
                          color: MyColors.white,
                        ),
                      ),
                    ],
                  ),
                  44.sbh,
                  Obx(() => _buildToggleRow(
                    "Music:",
                    controller.isMusicOn.value,
                    controller.toggleMusic,
                    Color.fromRGBO(84, 139, 96, 1),
                  )),
                ],
              ),
            ),
          );
        },
      );
    }

    static Widget _buildToggleRow(
        String label, bool value, Function() onChanged, Color activeColor) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: kSize14DarkW400Text.copyWith(
              fontSize: 20.sp,
              color: MyColors.white,
            ),
          ),
          Switch(
            value: value,
            onChanged: (val) => onChanged(),
            activeColor: activeColor,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ],
      );
    }
  }
