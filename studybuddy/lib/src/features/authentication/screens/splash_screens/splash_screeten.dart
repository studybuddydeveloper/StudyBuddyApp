import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:studybuddy/src/constants/sizes.dart';
import 'package:studybuddy/src/reusable_widgets/fade_in_animation_model.dart';
import '../../../../constants/image_strings.dart';
import '../../../../reusable_widgets/fade_in_animation_widget.dart';
import '../../../../reusable_widgets/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {

  SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
           // This observer is used to animate the splash screen
            SFadeInAnimationWidget(
              durationInMs: 1600,
              animate: SAnimatePosition(
                topBefore: -30,
                topAfter: 0,
                leftBefore: -30,
                leftAfter: 0,
              ),
              child: Image(
                width: 450,
                height: 300,
                image: AssetImage(SSplashTopIcon),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),

            SFadeInAnimationWidget(
                durationInMs: 2000,
                animate: SAnimatePosition(
                  topBefore: 80,
                  topAfter: 300,
                  leftBefore: -80,
                  leftAfter: 100,
                ),
                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //  TODO add const for default sizing
                                Text('Study Buddy', style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                                Text('Your study companion', style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                )
                                ),
                              ],
                )
            ),
            SFadeInAnimationWidget(
                durationInMs: 2000,
                animate: SAnimatePosition(
                  bottomAfter: 100,
                  bottomBefore: 0
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: controller.animate.value ? 1 : 0,
                  child: Image(
                    width: 450,
                    height: 300,
                    image: AssetImage(SSplashImage),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}


