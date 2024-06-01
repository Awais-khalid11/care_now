import 'package:CareNow/views/screens/screen_pick_blood_group.dart';
import 'package:CareNow/widgets/button.dart';
import 'package:CareNow/widgets/regular_text.dart';
import 'package:CareNow/widgets/semi_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../helpers/constants.dart';
import '../../controllers/controller_information.dart';
import '../../helpers/location_utils.dart';
import '../../widgets/textField.dart';

class ScreenInformation extends StatelessWidget {
  final InformationController controller = Get.put(InformationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<InformationController>(builder: (logic) {
          return FutureBuilder<bool>(
              future: checkPermissionStatus(),
              builder: (context, permissionSnapShot) {
                if (permissionSnapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 1,
                        backgroundColor: MyColor.redColor2,
                      ));
                }
                else if (permissionSnapShot.data == false) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Permission Required"),
                        TextButton(
                            onPressed: () {
                              logic.update();
                            },
                            child: Text("Retry"))
                      ],
                    ),
                  );
                }
                else {
                  return FutureBuilder<String?>(
                      future: getAddressFromCurrentLocation(),
                      builder: (context, addressSnapshot) {
                        if (addressSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 1,
                                backgroundColor: MyColor.redColor2,
                              ));
                        }

                        controller.address = addressSnapshot.data!;

                        return FutureBuilder<Position>(
                            future: Geolocator.getCurrentPosition(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator.adaptive(
                                      strokeWidth: 1,
                                      backgroundColor: MyColor.redColor2,
                                    ));
                              }
                              controller.latitude = snapshot.data!.latitude;
                              controller.longitude = snapshot.data!.longitude;
                              // controller.update();
                              return Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 3.h),
                                          Hero(
                                            tag: 'ani1',
                                            child: Image.asset(
                                              'assets/images/blood_drop.png',
                                              height: 18.h,
                                              width: 22.w,
                                            ),
                                          ),
                                          SizedBox(height: 3.h),
                                          SemiBoldText(text: 'Information'),
                                          SizedBox(height: 3.h),
                                          CustomTextField(
                                            hint: 'Name',
                                            controller: controller
                                                .nameController,
                                            color:
                                            MyColor.blackColor.withOpacity(0.4),
                                          ),
                                          SizedBox(height: 10),
                                          CustomTextField(
                                            hint: 'Address',
                                            controller: controller
                                                .addressController
                                              ..text = controller.address,
                                            onChange: (value) {
                                              controller.address = value!;
                                            },
                                            color:
                                            MyColor.blackColor.withOpacity(0.4),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 40.sp,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.sp),
                                            decoration: BoxDecoration(
                                              color:
                                              MyColor.redColor.withOpacity(0.1),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Obx(
                                                  () =>
                                                  DropdownButton<String>(
                                                    isExpanded: true,
                                                    underline: SizedBox(),
                                                    value: controller.gender
                                                        .value,
                                                    onChanged: (String? value) {
                                                      if (value != null) {
                                                        controller.setGender(
                                                            value);
                                                      }
                                                    },
                                                    items: InformationController
                                                        .genderList
                                                        .map<DropdownMenuItem<
                                                        String>>(
                                                          (String value) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: RegularText(
                                                              text: '$value',
                                                              fontSize: 13.sp,
                                                              color: MyColor
                                                                  .redColor,
                                                            ),
                                                          ),
                                                    )
                                                        .toList(),
                                                    dropdownColor: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    iconEnabledColor: Colors
                                                        .pink,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      size: 21.sp,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 1.h),
                                            alignment: Alignment.center,
                                            height: 40.sp,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.sp),
                                            decoration: BoxDecoration(
                                              color:
                                              MyColor.redColor.withOpacity(0.1),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Obx(
                                                  () =>
                                                  DropdownButton<String>(
                                                    isExpanded: true,
                                                    underline: SizedBox(),
                                                    value: controller.userType
                                                        .value,
                                                    onChanged: (String? value) {
                                                      if (value != null) {
                                                        controller.setUserType(
                                                            value);
                                                      }
                                                    },
                                                    items: InformationController
                                                        .userList
                                                        .map<DropdownMenuItem<
                                                        String>>(
                                                          (String value) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: RegularText(
                                                              text: '$value',
                                                              fontSize: 13.sp,
                                                              color: MyColor
                                                                  .redColor,
                                                            ),
                                                          ),
                                                    )
                                                        .toList(),
                                                    dropdownColor: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    iconEnabledColor: Colors
                                                        .pink,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      size: 21.sp,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                          SizedBox(height: 3.h),
                                          Button(
                                            text: 'continue',
                                              onPressed: () async {

                                                var response = await controller.updateData();
                                                if (response == "updated") {

                                                  Get.offAll(ScreenPickBloodGroup());
                                                } else {
                                                  Get.snackbar("Error", response.toString(),
                                                      snackPosition: SnackPosition.BOTTOM,
                                                      backgroundColor: MyColor.redColor2,
                                                      colorText: Colors.white);
                                                }
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '2023. All rights reserved',
                                    style: TextStyle(
                                      color: MyColor.blackColor.withOpacity(
                                          0.5),
                                      fontFamily: 'SatoshiBold',
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              );
                            });
                      });
                }
              });
        }),
      ),
    );
  }
}
