import 'package:care_now/helpers/constants.dart';
import 'package:care_now/widgets/light_text.dart';
import 'package:care_now/widgets/medium_text.dart';
import 'package:care_now/widgets/regular_text.dart';
import 'package:care_now/widgets/semi_bold_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/phone_controller.dart';

class ScreenPhoneVerification extends StatelessWidget {
  ScreenPhoneVerification({super.key});

  final PhoneController controller = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.whiteColor,
        body: Column(
          children: [
            SizedBox(height: 7.h),
            Hero(
              tag: 'ani1',
              child: Image.asset(
                'assets/images/blood_drop.png',
                height: 18.h,
                width: 22.w,
              ),
            ),
            SizedBox(height: 5.h),
            SemiBoldText(text: 'Phone Verification'),
            SizedBox(height: 2.h),
            RegularText(
              text: 'We sent a code to your number ',
              fontSize: 13.sp,
              color: MyColor.blackColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${controller.country_code} ${controller.phoneController.value.text}',
                  style: TextStyle(
                    fontFamily: 'PoppinsExtraLight',
                    fontSize: 12.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: LightText(
                    text: '  Change',
                    color: MyColor.redColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Pinput(
                controller: controller.pinPutController.value,
                length: 6,
                onCompleted: (value){
                  controller.verifyPin(value);
                },
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: PinTheme(
                    height: 40.sp,
                    width: 40.sp,
                    decoration: BoxDecoration(
                        color: MyColor.pinPutColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RegularText(
                  text: "Don't receive your code?",
                  fontSize: 11.sp,
                  color: MyColor.blackColor,
                ),
                GestureDetector(
                  onTap: () async {

                    await controller.sendVerificationCodeAgain();
                  },
                  child: MediumText(
                    text: ' Resend',
                    color: MyColor.redColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
