/*
    ---------------------------------------
    Project: Plinkos Puzzle Game Mobile Application
    Date: March 29, 2024
    Author: Ameer from Pakistan
    ---------------------------------------
    Description: here all custom colors
  */
import 'package:cric_q/utils/extensions/extentions.dart';
import 'package:cric_q/utils/values/my_color.dart' show MyColors;
import 'package:cric_q/utils/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;
  final Widget? icon;
  final EdgeInsetsGeometry padding;
  final Color borderColor; // New property for border color

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = MyColors.btnColor,
    this.textColor = Colors.white,
    this.width = 255,
    this.height = 64.0,
    this.borderRadius = 23.0,
    this.textStyle,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(color: borderColor, width: 5.w),
          padding: padding,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, 8.sbh],
            Text(
              text,
              style: textStyle
            ),
          ],
        ),
      ),
    );
  }
}
