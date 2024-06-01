import 'package:CareNow/helpers/check_mental_health.dart';
import 'package:CareNow/views/screens/screen_check_anxiety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/constants.dart';

class ScreenCheckMentalHealth extends StatelessWidget {
  const ScreenCheckMentalHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Check Mental Health",
          style: TextStyle(color: Colors.black,
          fontFamily: "Poppins",
            fontWeight: FontWeight.w800,
            fontSize: 22
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Get.to(ScreenCheckAnxiety(
                questionsList: depressionList,
                disorder: "Check Depression Level",
              ));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 6.sp),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          // spreadRadius: 1,
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.07))
                    ]),
                child: Text("Check Depression Level")),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ScreenCheckAnxiety(
                questionsList: anxiety,
                disorder: "Anxiety Disorder",
              ));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 6.sp),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          // spreadRadius: 1,
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.07))
                    ]),
                child: Text("Anxiety Disorder")),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ScreenCheckAnxiety(
                questionsList: generalizedAnxietyDisorder,
                disorder: "Generalized Anxiety Disorder",
              ));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 6.sp),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          // spreadRadius: 1,
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.07))
                    ]),
                child: Text("Generalized Anxiety Disorder")),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ScreenCheckAnxiety(
                questionsList: panicDisorder,
                disorder: "Panic Disorder",
              ));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 6.sp),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          // spreadRadius: 1,
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.07))
                    ]),
                child: Text("Panic Disorder")),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ScreenCheckAnxiety(
                questionsList: obsessiveCompulsiveDisorder,
                disorder: "Obsessive-Compulsive Disorder (OCD)",
              ));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 6.sp),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          // spreadRadius: 1,
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.07))
                    ]),
                child: Text("Obsessive-Compulsive Disorder (OCD)")),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: (){
                  _launchPhoneCall();
                },

                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 20, bottom: 20),
                  height: 40,
                  width: 120,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7)
                  ),
                  child: Text("Emergency Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                ),
              ),
            ),
          )
        ],
      ).marginSymmetric(vertical: 20),

    );
  }
  void _launchPhoneCall() async {
    const phoneNumber = 'tel:+923080488548'; // Replace with the desired phone number
    try {
      if (await canLaunch(phoneNumber)) {
        await launch(phoneNumber);
      } else {
        throw 'Could not launch $phoneNumber';
      }
    } catch (e) {
      print('Error launching phone call: $e');
      // Handle error gracefully (e.g., show a snackbar or dialog)
    }
  }

}
