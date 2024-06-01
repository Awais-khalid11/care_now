import 'dart:developer';

import 'package:CareNow/controllers/controller_home.dart';
import 'package:CareNow/controllers/search_controller.dart';
import 'package:CareNow/extensions/widget_extension.dart';
import 'package:CareNow/helpers/constants.dart';
import 'package:CareNow/helpers/firebase_utils.dart';
import 'package:CareNow/helpers/helper.dart';
import 'package:CareNow/models/history.dart';
import 'package:CareNow/views/screens/screen_add_history.dart';
import 'package:CareNow/views/screens/screen_anxiety_and_disease.dart';
import 'package:CareNow/views/screens/screen_check_anxiety.dart';
import 'package:CareNow/views/screens/screen_check_mental_health.dart';
import 'package:CareNow/views/screens/screen_information.dart';
import 'package:CareNow/views/screens/screen_profile.dart';
import 'package:CareNow/widgets/medium_text.dart';
import 'package:CareNow/widgets/regular_text.dart';
import 'package:CareNow/widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/ItemHistory.dart';

class ScreenHome extends StatelessWidget {
  SearchingController controller = Get.put(SearchingController());
  ControllerHome controllerHome=Get.put(ControllerHome());
  @override
  Widget build(BuildContext context) {
    log(controllerHome.user.value.toString());
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return (controllerHome.user.value == null)?CircularProgressIndicator():SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'image',
                  child: Image.asset(
                    'assets/images/blood_drop.png',
                    width: 25.sp,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.center,
                          child: RegularText(
                            text: 'Donor History',
                            color: MyColor.blackColor.withOpacity(0.6),
                            fontSize: 12.sp,
                          )),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ScreenProfile());
                          },
                          child: Hero(
                            tag: 'profile',
                            child: Material(
                              color: Colors.transparent,
                              child: MediumText(text: 'Profile'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Container(
                //   height: 20.h,
                //   width: Get.width,
                //   alignment: Alignment.bottomRight,
                //   decoration: BoxDecoration(
                //     color: MyColor.whiteColor,
                //     borderRadius: BorderRadius.circular(10),
                //     image: DecorationImage(image: AssetImage("assets/images/heartbeat.jpg"),fit: BoxFit.cover),
                //     boxShadow: [
                //       BoxShadow(
                //         color: MyColor.blackColor.withOpacity(0.1),
                //         blurRadius: 10,
                //         offset: Offset(0, 0),
                //       )
                //     ],
                //   ),
                //   child: GestureDetector(
                //     onTap: (){
                //       Get.to(ScreenAnxietyAndDisease());
                //     },
                //     child: Container(
                //       padding: EdgeInsets.all(6),
                //       margin: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(25),
                //         color: MyColor.redColor
                //       ),
                //       child: Text("Anxiety and Disease",style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 8.sp
                //       ),),
                //     ),
                //   ),
                // ),
                SizedBox(height: 3.h),
                Obx(() {
                  return (controllerHome.user.value!.userType=="Receiver")?SizedBox():Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ScreenAddHistory());
                      },
                      child: Row(
                        children: [
                          MediumText(
                            text: 'History  ',
                            color: MyColor.blackColor,
                          ),
                          Icon(
                            Icons.add_circle_rounded,
                            color: MyColor.redColor,
                            size: 18.sp,
                          )
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Search History....',
                  color: MyColor.blackColor.withOpacity(0.2),
                  onChange: (value) {
                    controller.query.value = value!;
                  },
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20.sp,
                    color: MyColor.blackColor.withOpacity(0.2),
                  ),
                ),

                SizedBox(height: 2.h),
                StreamBuilder<QuerySnapshot>(
                  stream: historyRef.snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 1,
                          backgroundColor: MyColor.redColor2,
                        ),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(child: Text("Something went wrong"));
                    }
                    var histories = snapshot.data!.docs.map((e) => History.fromMap(e.data() as Map<String, dynamic>)).toList();

                    if (controllerHome.user.value!.userType=="Donor") {
                      histories = histories.where((element) => element.userId == controllerHome.user.value!.id).toList();}
                    histories.sort((a, b) => b.date.compareTo(a.date));

                    // Create an RxList to store the filtered histories
                    var filteredHistories = <History>[].obs;

                    // Update the filtered histories whenever the query changes
                    ever(controller.query, (_) {
                      var query = controller.query.value.toLowerCase();

                      // Filter histories based on search query
                      filteredHistories.value = histories.where((history) {
                        var address = history.address.toLowerCase();
                        var receiverName = history.receiverName.toLowerCase();
                        return address.contains(query) || receiverName.contains(query);
                      }).toList();
                    });

                    return Obx(() => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var history = (controller.query.value.isEmpty)?histories[index]:filteredHistories[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(history.date))} "
                              ,
                              style: TextStyle(color: Colors.black.withOpacity(.5),),
                            ).marginSymmetric(vertical: 5),
                            ItemHistory(
                              index: index,
                              history: history,
                            ),
                          ],
                        );
                      },
                      itemCount: (controller.query.value.isEmpty)?histories.length:filteredHistories.length,
                      separatorBuilder: (context, index) => SizedBox(height: 10.sp),
                    ));
                  },
                ),

              ],
            ).withSymmetricPadding(horizon: 5.w, vert: 3.h),
          );
        }),
      ),
    );
  }
}
