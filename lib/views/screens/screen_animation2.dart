import 'package:CareNow/views/screens/screen_animation3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Animation2 extends StatelessWidget {
  const Animation2({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 800), () {
      Get.offAll(Animation3());
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: 'image',
            child: Image.asset(
              'assets/images/logo.png',
              width: 70.sp,
            ),
          ),
        ),
      ),
    );
  }
}
