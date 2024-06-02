import 'package:care_now/controllers/controller_home.dart';
import 'package:care_now/extensions/widget_extension.dart';
import 'package:care_now/helpers/constants.dart';
import 'package:care_now/helpers/helper.dart';
import 'package:care_now/models/user.dart';
import 'package:care_now/views/screens/screen_add_history.dart';
import 'package:care_now/views/screens/screen_home.dart';
import 'package:care_now/widgets/medium_text.dart';
import 'package:care_now/widgets/semi_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/history.dart';
import '../../widgets/light_text.dart';
import 'home_screen.dart';

class ScreenHistoryDetail extends StatelessWidget {
  ControllerHome controllerHome = Get.put(ControllerHome());
  int index;
  History history;
  User user;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(history.timeStamp);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Obx(() {
              return (controllerHome.user.value!.userType == "Receiver")
                  ? SizedBox()
                  : Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Get.to(ScreenAddHistory(
                          history: history,
                        ));
                      },
                      icon: Icon(
                        Icons.mode_edit_sharp,
                        color: MyColor.redColor2,
                      )),
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          content: Container(
                              height: 6.h,
                              child: Text(
                                  "Are you sure to delete your \nblood history?")),
                          actions: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("No",
                                        style:
                                        TextStyle(color: Colors.white)),
                                    style: OutlinedButton.styleFrom(
                                        textStyle:
                                        TextStyle(color: Colors.white),
                                        // maximumSize: Size(80, 25.sp),
                                        backgroundColor: MyColor.redColor2),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: OutlinedButton(
                                      onPressed: () async {
                                        await historyRef
                                            .doc(history.id)
                                            .delete();
                                        Get.offAll(HomeScreen());
                                      },
                                      style: OutlinedButton.styleFrom(
                                          textStyle: TextStyle(
                                              color: Colors.white),
                                          backgroundColor:
                                          MyColor.redColor2),
                                      child: Text(
                                        "Yes",
                                        style:
                                        TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        color: MyColor.redColor2,
                      )),
                ],
              );
            })
          ],
          backgroundColor: MyColor.whiteColor,
          elevation: 0,
          title: SemiBoldText(
            text: 'History Detail',
            fontSize: 13.sp,
            color: MyColor.blackColor,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: MyColor.blackColor,
              size: 18.sp,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: MyColor.redColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Receiver',
                              style: TextStyle(
                                  color: MyColor.whiteColor,
                                  fontSize: 10.sp,
                                  fontFamily: "PoppinsExtraLight",
                                  fontStyle: FontStyle.italic),
                            ),
                            SemiBoldText(
                              text: history.receiverName,
                              color: MyColor.whiteColor,
                              fontSize: 11.sp,
                              fontStyle: FontStyle.italic,
                            )
                          ],
                        ).withOnlyPadding(top: 12.sp, left: 12.sp),
                        Hero(
                          tag: index.toString(),
                          child: Image.asset(
                            'assets/images/blood_drop_white.png',
                            height: 60.sp,
                          ).withSymmetricPadding(horizon: 15.sp, vert: 25.sp),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MediumText(
                      text: 'Bio Information',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                  ).withOnlyPadding(top: 5.w),
                  Container(
                    decoration: BoxDecoration(
                      color: MyColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: MyColor.blackColor.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(-1, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MediumText(
                                text: 'Donor Name :',
                                color: MyColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: LightText(
                                text: user.name,
                                color: MyColor.blackColor.withOpacity(0.4),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: MyColor.dividerColor,
                          height: 18.sp,
                          thickness: 2.sp,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MediumText(
                                text: 'Donor Phone :',
                                color: MyColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: LightText(
                                text: user.phone,
                                color: MyColor.blackColor.withOpacity(0.4),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: MyColor.dividerColor,
                          height: 18.sp,
                          thickness: 2.sp,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MediumText(
                                text: 'Blood Group :',
                                color: MyColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3 ,
                              child: LightText(
                                text: user.bloodGroup,
                                color: MyColor.blackColor.withOpacity(0.4),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: MyColor.dividerColor,
                          thickness: 2.sp,
                          height: 18.sp,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MediumText(
                                text: 'Receiver Gender :',
                                color: MyColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: LightText(
                                text: history.gender,
                                color: MyColor.blackColor.withOpacity(0.4),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: MyColor.dividerColor,
                          thickness: 2.sp,
                          height: 18.sp,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MediumText(
                                text: 'Donate Quantity :',
                                color: MyColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: LightText(
                                text: '${history.quantity} ml',
                                color: MyColor.blackColor.withOpacity(0.4),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: MyColor.dividerColor,
                          thickness: 2.sp,
                          height: 18.sp,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MediumText(
                                text: 'Receiver Address :',
                                color: MyColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: LightText(
                                text: history.address,
                                color: MyColor.blackColor.withOpacity(0.4),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).withSymmetricPadding(horizon: 3.w, vert: 3.w),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MediumText(
                      text: 'Age Information',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                  ).withOnlyPadding(top: 5.w),
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                    decoration: BoxDecoration(
                      color: MyColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: MyColor.blackColor.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(-1, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: LightText(
                          text: '${history.age}  years',
                          color: MyColor.blackColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MediumText(
                      text: 'Reason',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                  ).withOnlyPadding(top: 5.w),
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                    decoration: BoxDecoration(
                      color: MyColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: MyColor.blackColor.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(-1, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: LightText(
                          text: history.reason,
                          color: MyColor.blackColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MediumText(
                      text: 'Donation date',
                      color: MyColor.blackColor.withOpacity(0.4),
                    ),
                  ).withOnlyPadding(top: 5.w),
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                    decoration: BoxDecoration(
                      color: MyColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: MyColor.blackColor.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(-1, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: LightText(
                          text: "${DateFormat.yMMMMd().format(dateTime)}",
                          color: MyColor.blackColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ).withSymmetricPadding(horizon: 5.w, vert: 5.w),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Obx(() {
                return (controllerHome.user.value!.userType == "Donor")
                    ? SizedBox()
                    :Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchPhoneCall();
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.call, color: MyColor.whiteColor,)
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          _launchWhatsAppChat();
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle
                            ),
                            child: Image.asset(
                              "assets/images/whatapp.png", height: 15,
                              width: 15,)
                        ),
                      ),

                    ],),
                );
              }),)

          ],
        ),
      ),
    );
  }

  ScreenHistoryDetail({
    required this.index,
    required this.history,
    required this.user,
  });

  void _launchWhatsAppChat() async {
    const phoneNumber = 'whatsapp://send?phone=+923080488548'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _launchPhoneCall() async {
    const phoneNumber = 'tel:+923080488548'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
