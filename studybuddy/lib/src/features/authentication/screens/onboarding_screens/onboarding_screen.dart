import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:studybuddy/src/constants/colors.dart';
import 'package:studybuddy/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/welcome_screens/welcome_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Implementing liquid swipe for onboarding pages
          LiquidSwipe(
              pages: obController.pages,
              liquidController: obController.controller,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              enableSideReveal: true,
              onPageChangeCallback: obController.onPageChangeCallback,
          ),
          SizedBox(height: 150.0,),
          Positioned(
            bottom: 60,
            child:
              OutlinedButton(
                onPressed: () => obController.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: sSecondaryColor),
                  foregroundColor: sPrimaryColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                  child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(Icons.arrow_forward_ios),
                )
                ),
              ),
          Positioned(
            top: 50,
            right: 20,
            child:
            TextButton(
              onPressed: () => Get.offAll(() => const WelcomeScreen()),
              child: Text("Skip",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            )
          ),
          Obx(
            () => Positioned(
                bottom: 10,
                child:
                  AnimatedSmoothIndicator(
                    activeIndex: obController.currentPage.value,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: Color(0xFF272727),
                      dotHeight: 10.0,
                    ),
            )),
          )

        ],
      ),
    );
  }
}

