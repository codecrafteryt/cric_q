  import 'package:flutter/material.dart';

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

    const CustomButton({
      Key? key,
      required this.text,
      required this.onPressed,
      // rgba(68, 117, 57, 0.85)
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white,
      this.width = double.infinity,
      this.height = 50.0,
      this.borderRadius = 8.0,
      this.textStyle,
      this.icon,
      this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            padding: padding,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: textStyle ?? TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }
  }
