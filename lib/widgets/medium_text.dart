import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../helpers/constants.dart';

class MediumText extends StatelessWidget {

  double? fontSize;
  Color? color;
  String? fontFamily, text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "Enter Text",
      style: TextStyle(
        fontFamily: fontFamily ??'PoppinsMedium',
        fontSize: fontSize??11.sp,
        color: color??MyColor.redColor,
      ),
    );
  }

  MediumText({
    this.fontSize,
    this.color,
    this.fontFamily,
    required this.text,
  });
}
