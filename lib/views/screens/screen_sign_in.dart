import 'package:CareNow/controllers/phone_controller.dart';
import 'package:CareNow/extensions/widget_extension.dart';
import 'package:CareNow/views/screens/screen_phone_verification.dart';
import 'package:CareNow/widgets/button.dart';
import 'package:CareNow/widgets/semi_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../helpers/constants.dart';

class ScreenSignIn extends StatelessWidget {
  PhoneController controller = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColor.whiteColor,
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Hero(
                    tag: 'ani1',
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 25.h,
                      width: 70.w,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SemiBoldText(text: 'Enter Phone Number'),
                  SizedBox(height: 5.h),
                  Container(
                    decoration: BoxDecoration(
                      color: MyColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: MyColor.blackColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(-1, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset('assets/images/flag.png')
                              .withOnlyPadding(left: 12.sp),
                        ),
                        Expanded(
                            flex: 3,
                            child: Obx(() {
                              return TextFormField(
                                controller: controller.phoneController.value,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: '3007837733',

                                    hintStyle: TextStyle(
                                        fontFamily: 'PoppinsRegular',
                                        fontSize: 10.sp),

                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              );
                            }))
                      ],
                    ),
                  ).marginOnly(bottom: 10),
                  Obx(() {
                    return Button(
                      text: controller.otpLoading.isTrue ? "Sending OTP ..." : "Continue",
                      onPressed: controller.otpLoading.isTrue ? null : () async {
                        print(controller.phoneController.value.text);
                        await controller.sendVerificationCode();
                      },
                    );
                  })
                ],
              ).withSymmetricPadding(horizon: 5.w),
            ),
            Text(
              '2024. All rights reserved',
              style: TextStyle(
                color: MyColor.blackColor.withOpacity(0.5),
                fontFamily: 'SatoshiBold',
                fontSize: 9.sp,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
/*IntlPhoneField(
                      decoration: InputDecoration(
                        counter: SizedBox(),
                        // contentPadding: EdgeInsets.only(top: 30),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: MyColor.whiteColor.withOpacity(0.3),
                      ),
                      initialCountryCode: '+92',
                      dropdownIconPosition: IconPosition.trailing,
                      flagsButtonPadding: EdgeInsets.only(left: 6 .sp,top: 6.sp),
                      dropdownIcon: Icon(
                        Icons.arrow_drop_down,
                        color: MyColor.blackColor,
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                    ),
* */

/*
* CustomTextField(
                      suffix: Row(
                        children: [
                          Image.asset('assets/images/flag.png').withAllPadding(8.sp),
                          Icon(Icons.arrow_drop_down,color: MyColor.blackColor,)
                        ],
                      ),
                      hintText: "+923157554749",
                    )*/
