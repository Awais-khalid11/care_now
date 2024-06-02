import 'package:care_now/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  String text;
  double? height;
  double? width;
  Color? color, textColor;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width?? 100.w,
      height: height??6.5.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? MyColor.redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor ?? MyColor.whiteColor,
                fontFamily: 'PoppinsRegular',
                fontSize: 13.sp),
          ),
        ),
      ),
    );
  }

  Button({
    required this.text,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.onPressed,
  });
}
