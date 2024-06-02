import 'package:care_now/helpers/constants.dart';
import 'package:care_now/views/screens/screen_check_mental_health.dart';
import 'package:care_now/views/screens/screen_diseases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
class ScreenAnxietyAndDisease extends StatelessWidget {
  const ScreenAnxietyAndDisease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed: (){Get.back();},),
        centerTitle: true,
        backgroundColor: MyColor.redColor,
        title: Text("Anxiety And Disease", style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22
        ),),
      ),

      body: Column(
        children: [
          Container(
            height: 20.h,
            width: Get.width,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: MyColor.whiteColor,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage("assets/images/anxiety.jpeg"),fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: MyColor.blackColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: GestureDetector(
              onTap: (){
                Get.to(ScreenCheckMentalHealth());
              },
              child: Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyColor.redColor
                ),
                child: Text("Check Anxiety Level",style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp
                ),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h),
            height: 20.h,
            width: Get.width,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: MyColor.whiteColor,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage("assets/images/disease.jpg"),fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: MyColor.blackColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: GestureDetector(
              onTap: (){
                Get.to(ScreenDiseases());
              },
              child: Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyColor.redColor
                ),
                child: Text("Disease",style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp
                ),),
              ),
            ),
          ),
        ],
      ).marginSymmetric(horizontal: 16, vertical: 10),
    );
  }
}


