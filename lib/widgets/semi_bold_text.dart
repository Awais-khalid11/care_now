import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../helpers/constants.dart';

class SemiBoldText extends StatelessWidget {
  double? fontSize;
  Color? color;
  String? fontFamily, text;
  FontStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "Enter Text",
      style: TextStyle(
        color: color ?? MyColor.blackColor,
        fontSize: fontSize ?? 21.sp ,
        fontFamily: fontFamily ?? "PoppinsSemiBold",
          fontStyle: fontStyle
      ),
    );
  }

  SemiBoldText({
    this.fontSize,
    this.color,
    this.fontFamily,
    required this.text,
    this.fontStyle
  });
}
