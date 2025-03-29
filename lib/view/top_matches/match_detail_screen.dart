  import 'package:cric_q/utils/extensions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  import '../../utils/values/my_color.dart';
  import '../../utils/values/style.dart';

  class MatchDetailsScreen extends StatelessWidget {
    final String title;
    final String story;
    final String image;


    MatchDetailsScreen({required this.title, required this.story, required this.image});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyColors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.green,
                Colors.green.shade900,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 50.0.h),
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.r),
                    border: Border.all(
                      color: MyColors.white,
                      width: 5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        image,
                        height: 200.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: kSize14DarkW400Text.copyWith(color: MyColors.white, fontSize: 18),
                      ),
                      30.sbh,
                      Text(
                        story,
                        textAlign: TextAlign.center,
                        style: kSize14DarkW400Text.copyWith(color: MyColors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
