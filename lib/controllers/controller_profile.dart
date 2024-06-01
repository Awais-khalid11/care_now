import 'package:CareNow/helpers/firebase_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/helper.dart';

class ProfileController extends GetxController {
  RxString imagePath = ''.obs;
  RxBool loading=false.obs;
  Future getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);
    if (image != null) {
      loading.value=true;
      imagePath.value = image.path.toString();
     var url=await FirebaseUtils.uploadImage(imagePath.value, "$appName/$uid/image").catchError((error){
       Get.snackbar("Error", error.toString());
       loading.value=false;
     });
     await userRef.doc(uid).update({"imageUrl":url}).then((value) {
       loading.value=false;
     }).catchError((error){
       Get.snackbar("Error", error.toString());
       loading.value=false;

     });

    }
    else{

      loading.value=false;
    }
  }
}
