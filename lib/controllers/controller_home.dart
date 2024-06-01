import 'dart:developer';

import 'package:CareNow/helpers/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:CareNow/models/user.dart' as model;
import '../helpers/fcm.dart';

class ControllerHome extends GetxController{
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Rx<model.User?> user = Rx<model.User?>(null);

  @override
  void onInit() {
    UserStream();
    updateToken();
    super.onInit();
  }
  void updateToken() async {
    var token = (await FCM.generateToken()) ?? "";
    userRef.doc(uid).update({"notificationToken": token});
  }
  void UserStream() {
    userRef.doc(uid).snapshots().listen((event) {
      user.value = model.User.fromMap(event.data() as Map<String, dynamic>);
      log("${user.value}");
    });
  }
}