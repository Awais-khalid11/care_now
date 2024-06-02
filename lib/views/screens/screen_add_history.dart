import 'package:care_now/extensions/widget_extension.dart';
import 'package:care_now/models/history.dart';
import 'package:care_now/views/screens/screen_home.dart';
import 'package:care_now/widgets/button.dart';
import 'package:care_now/widgets/custom_progress_widget.dart';
import 'package:care_now/widgets/light_text.dart';
import 'package:care_now/widgets/semi_bold_text.dart';
import 'package:care_now/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/controller_add_history.dart';
import '../../helpers/constants.dart';
import '../../helpers/helper.dart';
import '../../widgets/medium_text.dart';
import '../../widgets/regular_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ScreenAddHistory extends StatelessWidget {
  History? history;

  final AddHistoryController controller = Get.put(AddHistoryController());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: MyColor.redColor,
            hintColor: MyColor.redColor,
            colorScheme: ColorScheme.light(
              primary: MyColor.redColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final String formattedDate =
          DateFormat('dd , MMMM , yyyy').format(pickedDate);
      controller.selectedDate.value = pickedDate;
      controller.donationDateController.value.text = formattedDate;
    }
  }
  History? historyToUpdate;
  void setHistoryToUpdate(History? history) {
    historyToUpdate = history;
    if (history != null) {
      controller.nameController.value.text = history.receiverName;
      controller.reasonController.value.text = history.reason;
      controller.bloodQuantityController.value.text = history.quantity;
      controller.receiverAddressController.value.text = history.address;
      controller.setBloodType(history.bloodGroup);
      controller.setGender(history.gender);
      controller.receiverAgeController.value.text = history.age;
      controller.selectedDate.value = DateTime.fromMillisecondsSinceEpoch(history.date);
      controller.donationDateController.value.text =
          DateFormat('dd , MMMM , yyyy').format(controller.selectedDate.value);
    }
  }

  Future<String> updateHistory() async {
    if (historyToUpdate == null) {
      return "No history data to update.";
    }

    String response = "";
    controller.loading.value = true;

    // Get updated values from the text fields and dropdowns
    String name = controller.nameController.value.text.trim();
    String age = controller.receiverAgeController.value.text.trim();
    String quantity = controller.bloodQuantityController.value.text.trim();
    String address = controller.receiverAddressController.value.text.trim();
    String reason = controller.reasonController.value.text.trim();
    int date = controller.selectedDate.value.millisecondsSinceEpoch;

    // Update the historyToUpdate object
    historyToUpdate!.receiverName = name;
    historyToUpdate!.age = age;
    historyToUpdate!.quantity = quantity;
    historyToUpdate!.address = address;
    historyToUpdate!.reason = reason;
    historyToUpdate!.bloodGroup = controller.bloodType.value;
    historyToUpdate!.gender = controller.gender.value;
    historyToUpdate!.date = date;

    await historyRef
        .doc(historyToUpdate!.id)
        .update(historyToUpdate!.toMap())
        .then((value) {
      response = "success";
      controller.loading.value = false;
    }).catchError((error) {
      response = error.toString();
      controller.loading.value = false;
    });
    return response;
  }
  @override
  Widget build(BuildContext context) {
    setHistoryToUpdate(history);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white.withOpacity(0.95),
        body: Obx(() {
          return CustomProgressWidget(
            loading: controller.loading.value,
            child: Form(
              key: controller.formKey.value,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/blood_drop.png',
                        width: 25.sp,
                      ).marginOnly(top: 3.h,bottom: 5),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 18.sp,
                          ),
                        ),
                        RegularText(
                          text: '${history==null?'Add History':"Edit History"}',
                          color: MyColor.blackColor.withOpacity(0.6),
                          fontSize: 13.sp,
                        ),
                        SizedBox(width: 25.sp,)
                      ],
                    ),
                    MediumText(
                      text: '${history==null?'Add History':"Edit History"}',
                      color: MyColor.blackColor,
                    ).marginSymmetric(vertical: 3.h),
                    LightText(
                      text: 'Receiver Name',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ).paddingOnly(bottom: 5),
                    CustomTextField(
                      controller: controller.nameController.value,
                      hint: 'Name',
                      validator: (value)=>controller.validateName(value.toString()),
                      color: MyColor.blackColor.withOpacity(0.4),
                      suffix: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          controller.nameController.value.clear();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: MyColor.blackColor,
                          size: 15.sp,
                        ),
                      ),

                    ).paddingOnly(bottom: 2.h),
                    LightText(
                      text: 'Reason',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ).paddingOnly(bottom: 5),
                    CustomTextField(
                        controller: controller.reasonController.value,
                        hint: 'Reason',
                        validator: (value)=>controller.validateReason(value.toString()),

                        color: MyColor.blackColor.withOpacity(0.4),
                        suffix: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            controller.reasonController.value.clear();
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            color: MyColor.blackColor,
                            size: 15.sp,
                          ),
                        )).marginOnly(bottom: 2.h),
                    LightText(
                      text: 'Blood Quantity',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ).marginOnly(bottom: 5),
                    CustomTextField(
                      hint: "100",
                      // limit: 4,
                      suffixText: "ml",
                      suffix: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          controller.bloodQuantityController.value.clear();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: MyColor.blackColor,
                          size: 15.sp,
                        ),
                      ),
                      validator: (value)=>controller.validateQuantity(value.toString()),
                      controller:
                      controller.bloodQuantityController.value,
                      keyboardType: TextInputType.number,
                    ).marginOnly(bottom: 2.h),

                    LightText(
                      text: "Receiver blood group",
                      color: MyColor.blackColor.withOpacity(0.4),
                    ).marginOnly(bottom: 5),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.sp, vertical: 3.sp),
                      decoration: BoxDecoration(
                        color: MyColor.redColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(
                        () => DropdownButton<String>(
                          underline: SizedBox(),
                          isExpanded: true,
                          value: controller.bloodType.value,
                          onChanged: (String? value) {
                            if (value != null) {
                              controller.setBloodType(value);
                            }
                          },
                          items: AddHistoryController.bloodGroupList
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: RegularText(
                                    text: '$value',
                                    fontSize: 13.sp,
                                    color: MyColor.whiteColor,
                                  ),
                                ),
                              )
                              .toList(),
                          dropdownColor: MyColor.redColor,
                          borderRadius: BorderRadius.circular(10),
                          iconEnabledColor: MyColor.whiteColor,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 21.sp,
                          ),
                        ),
                      ),
                    ).marginOnly(bottom: 2.h),
                    LightText(
                      text: "Gender",
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.sp, vertical: 3.sp),
                      decoration: BoxDecoration(
                        color: MyColor.redColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(
                        () => DropdownButton<String>(
                          isExpanded: true,
                          underline: SizedBox(),
                          value: controller.gender.value,
                          onChanged: (String? value) {
                            if (value != null) {
                              controller.setGender(value);
                            }
                          },
                          items: AddHistoryController.genderList
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: RegularText(
                                    text: '$value',
                                    fontSize: 13.sp,
                                    color: MyColor.whiteColor,
                                  ),
                                ),
                              )
                              .toList(),
                          dropdownColor: MyColor.redColor,
                          borderRadius: BorderRadius.circular(10),
                          iconEnabledColor: MyColor.whiteColor,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 21.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    LightText(
                      text: 'Receiver Address',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                        controller: controller.receiverAddressController.value,
                        hint: 'Receiver Address',
                        validator: (value)=>controller.validateAddress(value.toString()),

                        color: MyColor.blackColor.withOpacity(0.4),
                        suffix: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            controller.receiverAddressController.value.clear();
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            color: MyColor.blackColor,
                            size: 15.sp,
                          ),
                        )),
                    SizedBox(height: 2.h),
                    LightText(
                      text: 'Donation date',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: controller.donationDateController.value,
                          hint: '05 , December , 2022',
                          color: MyColor.blackColor.withOpacity(0.4),
                          suffix: SvgPicture.asset(
                            'assets/images/Calender.svg',
                          ).withAllPadding(10.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    LightText(
                      text: 'Receiver age',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      hint: '22',
                      suffixText: "Years",
                      // limit: 3,
                      // minLines: 1,
                      suffix: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          controller.receiverAgeController.value.clear();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: MyColor.blackColor,
                          size: 15.sp,
                        ),
                      ),
                      controller: controller.receiverAgeController.value,
                      validator: (value)=>controller.validateAge(value.toString()),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 3.h),
                    Button(text: '${history==null?'Submit Detail':"Update History"}', onPressed: () async {

                      if ((controller
                          .formKey.value.currentState!
                          .validate())) {
                        var response=(history==null)?await controller.addHistory():await updateHistory() ;
                        if (response=="success") {
                          controller.nameController.value.clear();
                          controller.receiverAgeController.value.clear();
                          controller.bloodQuantityController.value.clear();
                          controller.receiverAddressController.value.clear();
                          controller.reasonController.value.clear();

                          Get.back();

                        }
                        else{
                          Get.snackbar("Error", response.toString(),colorText: Colors.white,backgroundColor: MyColor.redColor2,snackPosition: SnackPosition.BOTTOM);
                        }
                      }
                    },)
                        .withOnlyPadding(bottom: 18.sp),
                  ],
                ).withSymmetricPadding(horizon: 5.w),
              ),
            ),
          );
        }),
      ),
    );
  }

  ScreenAddHistory({
    this.history,
  });
}
