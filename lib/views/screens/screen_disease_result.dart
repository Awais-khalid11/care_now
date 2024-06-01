import 'package:CareNow/helpers/disease_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/constants.dart';

class ScreenDiseaseResult extends StatelessWidget {

  Disease disease;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(disease.diseaseName, style: TextStyle(
            color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: "Poppins",
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Symptoms", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,),),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.sp),
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // spreadRadius: 1,
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.07)
                    )
                  ]
              ),
              child: Text(disease.symptoms)),
          Text("Precautions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,),),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.sp),
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // spreadRadius: 1,
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.07)
                    )
                  ]
              ),
              child: Text(disease.precautions)),
        ],
      ).marginSymmetric(horizontal: 16.sp, vertical: 20.sp),
    );
  }

  ScreenDiseaseResult({
    required this.disease,
  });
}
