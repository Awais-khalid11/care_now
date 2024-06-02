import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:care_now/models/user.dart' as model;
import '../helpers/helper.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/screen_home.dart';
import '../views/screens/screen_information.dart';
import '../views/screens/screen_phone_verification.dart';

class PhoneController extends GetxController {
//Add more Detail

  //Phone Auth
  RxString country_code = "+92".obs;
  final showLoading = false.obs;

  final _auth = FirebaseAuth.instance;
  final pinPutController = TextEditingController().obs;
  String _verificationId = "";
  final phoneController = TextEditingController().obs;

  RxBool otpLoading = false.obs;

  Future<String> sendVerificationCode() async {
    String response = '';
    String phone = phoneController.value.text;

    if (country_code.isEmpty || phone.isEmpty) {
      return "Phone is required";
    }

    String full_phone = country_code + phoneController.value.text;
    print(full_phone);

    otpLoading.value = true;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: (full_phone),
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        otpLoading.value = false;
        _auth.signInWithCredential(credential).then((value) {
          pinPutController.value.text = credential.smsCode ?? "";
          verificationCompleted(value);
        }).catchError((error) {
          Get.snackbar("Alert", error.toString());
          // print(error.toString());
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Alert", e.toString());
        otpLoading.value = false;

        print(e);
        Get.back();
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        otpLoading.value = false;

        Get.to(ScreenPhoneVerification());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
        otpLoading.value = false;

      },
    );
    return response;
  }
  Future<String> sendVerificationCodeAgain() async {
    String response = '';
    String phone = phoneController.value.text;

    if (country_code.isEmpty || phone.isEmpty) {
      return "Phone is required";
    }

    String full_phone = country_code + phoneController.value.text;
    print(full_phone);

    // Get.to(ScreenPhoneVerification());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: (full_phone),
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        _auth.signInWithCredential(credential).then((value) {
          pinPutController.value.text = credential.smsCode ?? "";
          verificationCompleted(value);
        }).catchError((error) {
          Get.snackbar("Alert", error.toString());
          // print(error.toString());
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Alert", e.toString());
        print(e);
        Get.back();
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
    return response;
  }

  Future<void> verifyPin(String pin) async {

    Get.snackbar("Alert", "Verifying OTP");

    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: pin);

    try {
      await _auth.signInWithCredential(phoneAuthCredential).then((value) {
        return verificationCompleted(value);
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar("Alert", e.message.toString());
    }
  }

  Future<void> verificationCompleted(UserCredential credential) async {
    showLoading.value = true;
    update();
    bool alreadyExists = await userAlreadyExists(credential.user!.uid);
    if (alreadyExists) {
      Get.offAll(HomeScreen());
    } else {
      await completeRegistration(credential);
    }
  }

  Future<String> completeRegistration(UserCredential userCredential) async {
    String response = "";
    var user = model.User(

      id: userCredential.user!.uid,
      phone: phoneController.value.text,
      countryCode: country_code.value,
      latitude: 0,
      imageUrl: "",
      notificationToken: "",
      name: "",
      gender: "",
      bloodGroup: "",
      address: "",
      longitude: 0,
      lastDonation: 0,
      timeStamp: DateTime.now().millisecondsSinceEpoch,
      block: false,
    );

    // newUser.id = userCredential.user!.uid;
    //
    await setDatabase(user).then((value) {
      if (value == "success") {
        Get.offAll(ScreenInformation());
      }
    });
    //
    showLoading.value = false;
    update();

    return response;
  }

  Future<bool> userAlreadyExists(String uid) async {
    final doc = await userRef.doc(uid).get();
    return doc.exists;
  }

  Future<String> setDatabase(model.User user) async {
    String response = "";
    await userRef.doc(user.id).set(user.toMap()).then((value) {
      response = "success";
    }).catchError((error) {
      Get.snackbar("Error", error.toString());
      response = error;
    });

    return response;
  }
}
