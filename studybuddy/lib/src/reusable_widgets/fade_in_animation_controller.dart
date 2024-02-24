import 'package:get/get.dart';

import '../features/authentication/screens/welcome_screens/welcome_screen.dart';

class FadeInAnimationController extends GetxController{

  //this is a singleton class that can be accessed from anywhere in the app
  //We don't have to call the instance of the class to access its methods
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 4200));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 4200));
    //destroys the current splash screen and replaces it with the welcome screen
    Get.offAll(() => const WelcomeScreen());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}