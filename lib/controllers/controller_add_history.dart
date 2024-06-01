import 'package:CareNow/helpers/firebase_utils.dart';
import 'package:CareNow/helpers/helper.dart';
import 'package:CareNow/models/history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHistoryController extends GetxController {
  RxBool loading = false.obs;
  RxString bloodType = RxString(bloodGroupList.first);
  RxString gender = RxString(genderList.first);
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> reasonController = TextEditingController().obs;
  Rx<TextEditingController> bloodQuantityController =
      TextEditingController().obs;
  Rx<TextEditingController> receiverAddressController =
      TextEditingController().obs;
  Rx<TextEditingController> receiverAgeController = TextEditingController().obs;
  Rx<TextEditingController> donationDateController =
      TextEditingController().obs;
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());

  static const List<String> bloodGroupList = <String>[
    'A +',
    'B +',
    'O +',
    'AB +',
    'A -',
    'B -',
    'O -',
    'AB -',
  ];
  static const List<String> genderList = <String>[
    'Male',
    'Female',
    'Other',
  ];

  void setBloodType(String value) {
    bloodType.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }

  Future<String> addHistory() async {
    String response = "";
    loading.value = true;
    String name =     nameController.value.text.trim();
    String age =      receiverAgeController.value.text.trim();
    String quantity = bloodQuantityController.value.text.trim();
    String address =  receiverAddressController.value.text.trim();
    String reason =   reasonController.value.text.trim();
    int date = selectedDate.value.millisecondsSinceEpoch;

    var history = History(
      id: FirebaseUtils.newId.toString(),
      receiverName: name,
      age: age,
      reason: reason,
      quantity: quantity,
      bloodGroup: bloodType.value,
      gender: gender.value,
      address: address,
      userId: FirebaseUtils.myId,
      timeStamp: FirebaseUtils.newId,
      date: date,
    );
    await historyRef.doc(history.id).set(history.toMap()).then((value) async {
      await userRef.doc(uid).update({"lastDonation": history.date});
      response = "success";

      loading.value = false;
    }).catchError((error) {
      response = error.toString();
      loading.value = false;
    });
    return response;
  }

  ///Validation Function

  final formKey = GlobalKey<FormState>().obs;

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Receiver Name required';
    }
    if (value.length < 4) {
      return 'Minimum 4 character required';
    }
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\s\-]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Name must only contain alphabetical characters, spaces, or hyphens';
    }
    return null;
  }

  String? validateReason(String value) {
    if (value.isEmpty) {
      return 'Please Write reason  ';
    }
    if (value.length < 5) {
      return 'Minimum 5 character required';
    }
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\s\-]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Name must only contain alphabetical characters, spaces, or hyphens';
    }
    return null;
  }

  String? validateQuantity(String value) {
    String pattern = r'^[0-9]';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value) || value == null) {
      return 'Enter Blood Quantity';
    } else {
      return null;
    }
  }

  String? validateAge(String value) {
    String pattern = r'^[0-9]';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value) || value == null) {
      return 'Enter Receiver Age';
    } else {
      return null;
    }
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Please enter Receiver address';
    }
    return null;
  }
}
