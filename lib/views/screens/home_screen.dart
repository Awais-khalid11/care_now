import 'package:care_now/views/screens/screen_check_mental_health.dart';
import 'package:care_now/views/screens/screen_diseases.dart';
import 'package:care_now/views/screens/screen_home.dart';
import 'package:care_now/widgets/light_text.dart';
import 'package:care_now/widgets/semi_bold_text.dart';
import 'package:care_now/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/controller_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CircleAvatar(
            //     radius: 30,
            //     backgroundColor: Colors.lightGreen,
            //     backgroundImage: AssetImage("assets/images/profile.png")),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   height: 5,
            //   width: 60,
            //   color: Colors.lightGreen,
            // ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Hello Dear! ",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: Colors.black)),
              // TextSpan(
              //     text: "Adim",
              //     style: TextStyle(
              //         fontFamily: "Poppins",
              //         fontWeight: FontWeight.w600,
              //         fontSize: 19,
              //         color: Colors.lightGreen)),
            ])),
            Text("How can we help you\ntoday?",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black)),
            CustomTextField(
              hint: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 3,
              width: 60,
              color: Colors.black,
            ),
            Text("Categories",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(ScreenHome());
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 2,
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/blood_drop.png",
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          "Donate\nBlood",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(ScreenDiseases());
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 2,
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/disease.png",
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          "Disease",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(ScreenCheckMentalHealth());
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/anxity.png",
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),
                        Text(
                          textAlign:TextAlign.center,
                          "Mental\nHealth",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ).marginSymmetric(vertical: 10),
            Text("Health Alert",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black)),
            ClipRect(
              child: Banner(
                  message: "Alert",
                  location: BannerLocation.topEnd,
              color: Colors.white,
              textStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
              child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(5),
                // height: 170,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 1,
                      color: Colors.grey.withOpacity(0.6)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Row(
                        children: [
                          SemiBoldText(text: 'Migraine',color: Colors.red,).marginOnly(right: 5),
                          LightText(text: "Severe throbbing pain\nusually on one side of the\nhead, nausea, vomiting\nsensitivity to light, sound\nor smells, visual\ndisturbances.", color: Colors.black, fontSize: 10,).marginOnly(top: 5)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/images/disease.png", height: 30,width: 30,).marginOnly(left: 30),
                            Image.asset("assets/images/disease.png", height: 50,width: 50,),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            _launchPhoneCall();
                          },
                          child: Container(

                            alignment: Alignment.center,
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: LightText(text: "Call The Doctor", color: Colors.red, fontSize: 10,),
                          ),
                        )
                      ],
                    ).marginOnly(right: 50)
                     ],
                ),
              ),
              ),
            ).marginSymmetric( vertical: 10)
          ],
        ).marginSymmetric(horizontal: 20, vertical: 30),
      ),
    );
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
