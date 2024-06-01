import 'dart:io';
import 'package:CareNow/controllers/controller_profile.dart';
import 'package:CareNow/extensions/widget_extension.dart';
import 'package:CareNow/helpers/constants.dart';
import 'package:CareNow/helpers/helper.dart';
import 'package:CareNow/models/user.dart' as model;
import 'package:CareNow/views/screens/screen_sign_in.dart';
import 'package:CareNow/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/light_text.dart';
import '../../widgets/medium_text.dart';
import '../../widgets/semi_bold_text.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.whiteColor,
          elevation: 0,
          title: Hero(
            tag: 'profile',
            child: Material(
              color: Colors.transparent,
              child: SemiBoldText(
                text: 'Profile',
                fontSize: 13.sp,
                color: MyColor.blackColor,
              ),
            ),
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
        body: StreamBuilder<DocumentSnapshot>(
            stream: userRef.doc(uid).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 1,
                    backgroundColor: MyColor.redColor2,
                  ),
                );
              }
              var user = model.User.fromMap(
                  snapshot.data!.data() as Map<String, dynamic>);
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
                          child: Center(
                            child: Obx(
                              () => Stack(
                                children: [
                                  Container(
                                    height: 18.h,
                                    width: 18.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: MyColor.blackColor
                                              .withOpacity(0.05),
                                          spreadRadius: 1,
                                          blurRadius: 15,
                                          offset: Offset(-1, 2),
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.5)),
                                      image: DecorationImage(
                                          image: user.imageUrl!.isEmpty
                                              ? NetworkImage(userPlaceHolder)
                                                  as ImageProvider<Object>
                                              : NetworkImage(user.imageUrl!),
                                          fit: BoxFit.cover),
                                    ),
                                    child: (controller.loading.value == false)
                                        ? SizedBox()
                                        : CircularProgressIndicator.adaptive(
                                            strokeWidth: 1,
                                            backgroundColor: MyColor.redColor2,
                                          ),
                                  ),
                                  Positioned(
                                    right: -2.sp,
                                    bottom: 10.sp,
                                    child: GestureDetector(
                                      onTap: () {
                                        _showImagePickerDialog(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: MyColor.whiteColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: MyColor.blackColor
                                                  .withOpacity(0.05),
                                              spreadRadius: 1,
                                              blurRadius: 15,
                                              offset: Offset(-1, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/camera_icon.png',
                                            height: 15.sp,
                                          ),
                                        ).withAllPadding(5.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          user.name!,
                          style: TextStyle(
                              color: MyColor.profileTextColor,
                              fontFamily: 'SatoshiMedium',
                              fontSize: 16.sp),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MediumText(
                            text: 'Bio Information',
                            color: MyColor.blackColor.withOpacity(0.4),
                          ),
                        ).withOnlyPadding(top: 5.w, bottom: 2.w),
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
                                      text: 'Name :',
                                      color: MyColor.blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: LightText(
                                      text: user.name!.toString(),
                                      color:
                                          MyColor.blackColor.withOpacity(0.4),
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
                                    flex: 3,
                                    child: LightText(
                                      text: user.bloodGroup,
                                      color:
                                          MyColor.blackColor.withOpacity(0.4),
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
                                      text: 'Gender :',
                                      color: MyColor.blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: LightText(
                                      text: user.gender,
                                      color:
                                          MyColor.blackColor.withOpacity(0.4),
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
                                      text: 'Address :',
                                      color: MyColor.blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: LightText(
                                      text: user.address,
                                      color:
                                          MyColor.blackColor.withOpacity(0.4),
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MediumText(
                                    text: 'UserType :',
                                    color: MyColor.blackColor,
                                  ),
                                  Row(

                                    children: [
                                      LightText(
                                        text: user.userType,
                                        color:
                                            MyColor.blackColor.withOpacity(0.4),
                                        fontSize: 10.sp,
                                      ),
                                      Switch(value: user.userType=="Donor", onChanged: (value) async {
                                       if(user.userType=="Donor"){
                                         await userRef.doc(FirebaseAuth.instance.currentUser!.uid).update(
                                             {
                                               "userType":"Receiver"
                                             });
                                       }
                                       else{
                                         await userRef.doc(FirebaseAuth.instance.currentUser!.uid).update(
                                             {
                                               "userType":"Donor"
                                             });
                                       }

                                      })
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ).withSymmetricPadding(horizon: 3.w, vert: 3.w),
                        ),
                        Button(
                          text: "Logout",
                          onPressed: () {
                            Get.defaultDialog(
                                content: Text("Are you sure to logout"),
                                actions: [
                                  OutlinedButton(
                                      onPressed: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Get.offAll(ScreenSignIn());
                                      },
                                      child: Text("Yes")),
                                  OutlinedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("No")),
                                ]);
                          },
                        ).marginOnly(bottom: 10.sp, top: 20.sp)
                      ],
                    ).withSymmetricPadding(horizon: 5.w),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/blood_drop.png',
                        width: 30.sp,
                      ),
                      MediumText(text: 'Blood Now')
                          .withOnlyPadding(top: 2.w, bottom: 8.w)
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    Get.bottomSheet(
      ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        // Set the border radius
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.sp),
          color: MyColor.whiteColor,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: MyColor.redColor,
                ),
                title: Text('Camera'),
                onTap: () {
                  Get.back();
                  controller.getImage(ImageSource.camera);
                },
              ),
              Divider(
                color: MyColor.blackColor,
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: MyColor.redColor,
                ),
                title: Text('Gallery'),
                onTap: () {
                  Get.back();
                  controller.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
