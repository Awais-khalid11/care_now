import 'package:get/get.dart';

import '../helpers/fcm.dart';
import '../helpers/helper.dart';

class SearchingController extends GetxController{
  RxString query = ''.obs;
  @override
  void onInit() {
    updateToken();

    super.onInit();
  }

  void updateToken() async {
    String token = (await FCM.generateToken()) ?? "";
    await userRef.doc(uid).update({"notificationToken": token});
  }

}