import 'package:care_now/views/screens/screen_animation2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Animation1 extends StatelessWidget {
  const Animation1({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 800), () {
      Get.offAll(Animation2());
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: 'image',
            child: Image.asset(
              'assets/images/logo.png',
              width: 40.sp,
            ),
          ),
        ),
      ),
    );
  }
}
