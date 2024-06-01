import 'package:CareNow/helpers/constants.dart';
import 'package:CareNow/views/screens/screen_sign_in.dart';
import 'package:CareNow/widgets/button.dart';
import 'package:CareNow/widgets/light_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.whiteColor,
        body: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Image.asset(
            //     'assets/images/logo.png',
            //     height: 17.h,
            //   ),
            // ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 40.h,
                    width: 50.w,
                  ).marginSymmetric(vertical: 3.h),
                  Button(
                    text: 'Get Start',
                    color: MyColor.redColor,
                    textColor: MyColor.blackColor,
                    onPressed: () {
                      Get.to(ScreenSignIn());
                    },
                  ),
                ],
              ).marginSymmetric(horizontal: 5.w),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LightText(text: 'Learn more', color: Colors.red,),
                GestureDetector(
                  onTap: () {
                    Get.to(ScreenSignIn());
                  },
                  child: Row(
                    children: [
                      LightText(text: 'Skip now', color: Colors.red,).marginOnly(right: 10),
                      Icon(
                        Icons.arrow_forward,
                        color: MyColor.redColor,
                        size: 13.sp,
                      )
                    ],
                  ),
                ),
              ],
            ).marginSymmetric(horizontal: 5.w, vertical: 3.h),
          ],
        ),
      ),
    );
  }
}
/*Container(
                      margin: EdgeInsets.only(top: 5.h),
                      width: 100.w,
                      height: 6.5.h,
                      decoration: BoxDecoration(
                        color: MyColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: MediumText(
                          text: 'Get Start',
                          color: MyColor.redColor,
                        ),
                      ),
                    ),*/
