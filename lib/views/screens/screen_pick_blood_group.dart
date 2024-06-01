import 'package:CareNow/controllers/controller_information.dart';
import 'package:CareNow/helpers/constants.dart';
import 'package:CareNow/views/screens/screen_animation1.dart';
import 'package:CareNow/widgets/button.dart';
import 'package:CareNow/widgets/custom_progress_widget.dart';
import 'package:CareNow/widgets/light_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScreenPickBloodGroup extends StatelessWidget {
  final InformationController controller = Get.put(InformationController());

  Widget buildBloodTypeContainer(String bloodType) {
    return Obx(() => GestureDetector(
          onTap: () => controller.selectBloodType(bloodType),
          child: Container(
            height: 15.w,
            width: 38.w,
            decoration: BoxDecoration(
              color: controller.getBloodTypeContainerColor(bloodType),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: LightText(
                text: bloodType,
                color: controller.getBloodTypeTextColor(bloodType),
              ),
            ),
          ),
        ));
  }

  Widget buildRhFactorContainer(String rhFactor) {
    return Obx(() => GestureDetector(
          onTap: () => controller.selectRhFactor(rhFactor),
          child: Container(
            height: 30.sp,
            width: 30.sp,
            decoration: BoxDecoration(
              color: controller.getRhFactorContainerColor(rhFactor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: LightText(
                text: rhFactor,
                color: controller.getRhFactorTextColor(rhFactor),
              ),
            ),
          ),
        ));
  }

  Widget buildCheckbox() {
    return Obx(
      () => Checkbox(
        activeColor: MyColor.redColor,
        shape: OvalBorder(),
        value: controller.isChecked.value,
        onChanged: (value) {
          controller.toggleCheckbox();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return CustomProgressWidget(
            loading: controller.loading.value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 3.h),
                    Hero(
                      tag: 'image',
                      child: Image.asset(
                        'assets/images/blood_drop.png',
                        height: 18.h,
                        width: 22.w,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Please Pick your\nblood type',
                      style: TextStyle(
                        fontFamily: 'PoppinsExtraLight',
                        fontSize: 25.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.sp),
                    LightText(
                      text: 'Don’t know about your blood type ?',
                      color: MyColor.redColor,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildBloodTypeContainer('A'),
                        buildBloodTypeContainer('B'),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildBloodTypeContainer('O'),
                        buildBloodTypeContainer('AB'),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildRhFactorContainer('+'),
                        buildRhFactorContainer('-'),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCheckbox(),
                        Expanded(
                          child: LightText(
                            text:
                                'I want to receive notifications blood donation campaigns',
                            fontSize: 9.sp,
                            color: MyColor.blackColor.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Button(text: 'Finish', onPressed: () async {

                      var response = await controller.updateData();
                      if (response == "updated") {

                        Get.offAll(Animation1());
                      } else {
                        Get.snackbar("Error", response.toString(),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: MyColor.redColor2,
                            colorText: Colors.white);
                      }
                    },)
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
