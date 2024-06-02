import 'package:care_now/helpers/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/constants.dart';
import '../views/screens/screen_animation1.dart';

class InformationController extends GetxController {
  RxBool loading = false.obs;
  double latitude = 0.0;
  double longitude = 0.0;

  String address = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxString gender = RxString(genderList.first);
  RxString userType = RxString("Donor");
  static const List<String> genderList = <String>[
    'Male',
    'Female',
    'Other',
  ];
  static const List<String> userList = <String>[
    'Donor',
    'Receiver',
  ];

  RxString bloodType = RxString('A');
  RxString rhFactor = RxString('+');
  RxBool isChecked = false.obs;

  void selectBloodType(String value) {
    bloodType.value = value;
  }

  void selectRhFactor(String value) {
    rhFactor.value = value;
  }

  Color getBloodTypeContainerColor(String bloodType) {
    return bloodType == this.bloodType.value
        ? MyColor.redColor
        : MyColor.pinPutColor;
  }

  Color getBloodTypeTextColor(String bloodType) {
    return bloodType == this.bloodType.value
        ? MyColor.whiteColor
        : MyColor.blackColor;
  }

  Color getRhFactorContainerColor(String rhFactor) {
    return rhFactor == this.rhFactor.value
        ? MyColor.redColor
        : MyColor.pinPutColor;
  }

  Color getRhFactorTextColor(String rhFactor) {
    return rhFactor == this.rhFactor.value
        ? MyColor.whiteColor
        : MyColor.blackColor;
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void setGender(String value) {
    gender.value = value;
  }
  void setUserType(String value) {
    userType.value = value;
  }

  String uid = FirebaseAuth.instance.currentUser!.uid;

  Future<String> updateData() async {
    String response = "";
    loading.value = true;
    String name = nameController.value.text.trim();

    print(
        "${latitude.toString()}/${longitude.toString()}/${gender.value.toString()}/${rhFactor.value.toString()}${bloodType.value.toString()}/${address.toString()}/$name");
    await userRef.doc(uid).update({
      "longitude": longitude,
      "latitude": latitude,
      "userType": userType.value,
      "address": address,
      "gender": gender.value,
      "name": name,
    }).then((value) {
      // print(object)
      response = "updated";
      loading.value = false;
    }).catchError((onError) {
      response = onError.toString();
      loading.value = false;
    });
    return response;
  }
  Future<String> updateBloodData() async {
    String response = "";
    loading.value = true;
    String name = nameController.value.text.trim();

    print(
        "${latitude.toString()}/${longitude.toString()}/${gender.value.toString()}/${rhFactor.value.toString()}${bloodType.value.toString()}/${address.toString()}/$name");
    await userRef.doc(uid).update({

      "bloodGroup": "${bloodType.value}${rhFactor.value}",
    }).then((value) {
      // print(object)
      response = "updated";
      loading.value = false;
    }).catchError((onError) {
      response = onError.toString();
      loading.value = false;
    });
    return response;
  }
}
