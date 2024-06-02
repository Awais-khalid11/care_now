import 'package:care_now/helpers/constants.dart';
import 'package:care_now/views/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'home_screen.dart';

class Animation3 extends StatelessWidget {
  const Animation3({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 800), () {
      Get.off(HomeScreen());
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.whiteColor,
        body: Center(
          child: Hero(
            tag: 'image',
            child: Image.asset(
              'assets/images/logo.png',
              width: 100.sp,
            ),
          ),
        ),
      ),
    );
  }
}
