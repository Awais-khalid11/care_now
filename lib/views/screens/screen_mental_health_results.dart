import 'package:CareNow/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenMentalHealthResults extends StatelessWidget {
 String disorder;
 int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:Colors.greenAccent,
        title: Text(
          disorder,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(

      children: [
        Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            alignment: Alignment.center,
          height: 15.h,
          width: Get.width,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.pinkAccent.withOpacity(0.2),
            image: DecorationImage(image: AssetImage("assets/images/mind.png"), scale: 0.6, alignment: Alignment.bottomCenter)
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("You are with ${getDisorderLevel(disorder, score)}", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins-Regular",
                ),),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 10),
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(score.toString(), style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white
                    ),),
                  ),
                ),
              ],
            )
        ).marginSymmetric(vertical: 10.sp),
        Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          alignment: Alignment.center,
          height: 15.h,
          width: Get.width,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: AssetImage("assets/images/resbg.png"), ),
            color: Colors.pinkAccent.withOpacity(0.2),
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("10 minutes meditation\nFor Relaxation", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Aclonica",
                ),),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: (){
                      _launchURL('https://www.youtube.com/watch?v=vPvIxwh9N2w');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      alignment: Alignment.center,
                      height: 4.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text("Play", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white
                      ),),
                    ),
                  ),
                ),
              ],
            )
        ),

      ],
    ).marginSymmetric(horizontal: 15, vertical: 10),

    );
  }

 ScreenMentalHealthResults({
    required this.disorder,
    required this.score,
  });
 String getDisorderLevel(String disorder, int score) {
   switch (disorder) {
     case 'Check Depression Level':
       return getDepressionLevel(score);
     case 'Anxiety Disorder':
       return getAnxietyLevel(score);
     case 'Generalized Anxiety Disorder':
       return getGeneralizedAnxietyLevel(score);
     case 'panic disorder':
       return getPanicDisorderLevel(score);
     case 'Obsessive-Compulsive Disorder (OCD)':
       return getOCDLevel(score);
     default:
       return 'Unknown Disorder';
   }
 }

 String getDepressionLevel(int score) {
   if (score >= 0 && score <= 4) {
     return 'Minimal or no depression';
   } else if (score >= 5 && score <= 9) {
     return 'Mild depression';
   } else if (score >= 10 && score <= 14) {
     return 'Moderate depression';
   } else if (score >= 15) {
     return 'Severe depression';
   } else {
     return 'Unknown';
   }
 }

 String getAnxietyLevel(int score) {
   if (score >= 0 && score <= 4) {
     return 'Minimal or no anxiety';
   } else if (score >= 5 && score <= 9) {
     return 'Mild anxiety';
   } else if (score >= 10 && score <= 14) {
     return 'Moderate anxiety';
   } else if (score >= 15) {
     return 'Severe anxiety';
   } else {
     return 'Unknown';
   }
 }

 String getGeneralizedAnxietyLevel(int score) {
   if (score >= 0 && score <= 4) {
     return 'Minimal or no generalized anxiety disorder';
   } else if (score >= 5 && score <= 9) {
     return 'Mild generalized anxiety disorder';
   } else if (score >= 10 && score <= 14) {
     return 'Moderate generalized anxiety disorder';
   } else if (score >= 15) {
     return 'Severe generalized anxiety disorder';
   } else {
     return 'Unknown';
   }
 }

 String getPanicDisorderLevel(int score) {
   if (score >= 0 && score <= 4) {
     return 'Minimal or no panic disorder';
   } else if (score >= 5 && score <= 9) {
     return 'Mild panic disorder';
   } else if (score >= 10 && score <= 14) {
     return 'Moderate panic disorder';
   } else if (score >= 15) {
     return 'Severe panic disorder';
   } else {
     return 'Unknown';
   }
 }

 String getOCDLevel(int score) {
   if (score >= 0 && score <= 4) {
     return 'Minimal or no obsessive-compulsive disorder';
   } else if (score >= 5 && score <= 9) {
     return 'Mild obsessive-compulsive disorder';
   } else if (score >= 10 && score <= 14) {
     return 'Moderate obsessive-compulsive disorder';
   } else if (score >= 15) {
     return 'Severe obsessive-compulsive disorder';
   } else {
     return 'Unknown';
   }
 }

 Future<void> _launchURL(String url) async {
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     throw 'Could not launch $url';
   }
 }
}
