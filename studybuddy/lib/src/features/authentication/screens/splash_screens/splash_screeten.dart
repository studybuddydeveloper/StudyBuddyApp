import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/constants/sizes.dart';
import '../../../../constants/image_strings.dart';
import '../../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          // This observer is used to animate the splash screen
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: splashController.animate.value ? 0 : -30,
                left: splashController.animate.value ? 0 : -30,
                child:
                    //    TODO image and icon need to have light and dark theme
                    //to account for state of the app
                    const Image(
                  image: AssetImage(SSplashTopIcon),
                  // fit: sSplashContainerSize,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  width: 490,
                  height: 500,
                )),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 50,
              left: splashController.animate.value ? sDefaultSize : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  TODO add const for default sizing
                    Text(
                      'Study Buddy',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B3937)),
                    ),
                    Text('Your study companion',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B3937))),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 100 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2400),
                opacity: splashController.animate.value ? 1 : 0,
                child: const Image(
                  width: 450,
                  height: 300,
                  image: AssetImage(SSplashImage),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          //TODO: Readd once app color is determined
          // Positioned(
          //   bottom: animate ? 60: 0,
          //   right: sDefaultSize,
          //   child: Container(
          //     width: sDefaultSize,
          //     height: sDefaultSize,
          //     color: sPrimaryColor,
          //   ),
          // ),
        ],
      ),
    ));
  }
}
