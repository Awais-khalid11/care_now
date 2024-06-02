import 'package:care_now/views/screens/home_screen.dart';
import 'package:care_now/views/screens/screen_information.dart';
import 'package:care_now/views/screens/screen_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:care_now/models/user.dart' as userModel;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'helpers/helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await checkAndRunApp();
}

Future<void> checkAndRunApp() async {
  var loggedIn = FirebaseAuth.instance.currentUser != null;
  Widget? screen;
  if (!loggedIn) {
    screen = SplashScreen();
  } else {
    var user = userModel.User.fromMap(
        (await userRef.doc(FirebaseAuth.instance.currentUser!.uid).get()).data()
            as Map<String, dynamic>);
    if (user.name == null ||
        user.name!.isEmpty ||
        user.address == null ||
        user.address!.isEmpty) {
      screen = ScreenInformation();
    } else {
      screen = HomeScreen();
    }
  }
  runApp(MyApp(
    screen: screen,
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  Widget screen;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: screen,
        defaultTransition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 800),
      ),
    );
  }

  MyApp({
    required this.screen,
  });
}
