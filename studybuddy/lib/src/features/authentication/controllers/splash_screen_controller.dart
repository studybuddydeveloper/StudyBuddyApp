import 'package:get/get.dart';

import '../screens/welcome_screen.dart';

class SplashScreenController extends GetxController {
  //this is a singleton class that can be accessed from anywhere in the app
  //We don't have to call the instance of the class to access its methods
  static SplashScreenController get instance => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    //destroys the current splash screen and replaces it with the welcome screen
    Get.to(const WelcomeScreen());
  }
}
