import 'dart:developer';

import 'package:CareNow/helpers/helper.dart';
import 'package:CareNow/models/history.dart';
import 'package:CareNow/models/user.dart';
import 'package:CareNow/widgets/regular_text.dart';
import 'package:CareNow/widgets/semi_bold_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../helpers/constants.dart';
import '../views/screens/screen_history_detail.dart';
class ItemHistory extends StatelessWidget {
  History history;
  int index;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: userRef.doc(history.userId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState==ConnectionState.waiting) {
          return SizedBox();
        }
        var user=User.fromMap(snapshot.data!.data()as Map<String,dynamic>);
        log(user.toString());
        return Container(
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
          child: ListTile(
            onTap: () {
              Get.to(ScreenHistoryDetail(index: index, history: history, user: user,));
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 5.sp),
            leading: Hero(
              tag: index.toString(),
              child: CircleAvatar(
                backgroundColor: MyColor.redColor2,
                radius: 20.sp,
                child: Image.asset(
                  'assets/images/blood_drop_white_small.png',
                  width: 14.sp,
                ),
              ),
            ),
            title: SemiBoldText(
              text: user.name,
              fontSize: 10.sp,
            ),
            subtitle: Text("${history.quantity} ml"),
            trailing: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.sp, vertical: 6.sp),
              child: RegularText(
                text: 'Open Details ',
                fontSize: 11.sp,
                color: MyColor.redColor,
              ),
              decoration: BoxDecoration(
                color: MyColor.redColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        );
      }
    );
  }

  ItemHistory({
    required this.history,
    required this.index,
  });
}
