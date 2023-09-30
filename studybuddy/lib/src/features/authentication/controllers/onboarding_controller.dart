import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_onboarding.dart';
import '../screens/onboarding_screens/onboarding_page_widget.dart';

class OnBoardingController extends GetxController {

  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnboardingPageWidget(
        model: OnBoardingModel(
          image: sOnboardingImage1,
          bgcolor: sPage1OnboardingColor,
          title: sOnboardingTitle1,
          subtitle: sOnboardingSubtitle1,
          counterText: sOnboardingCounter1,
        )
    ),

    OnboardingPageWidget(
        model: OnBoardingModel(
          image: sOnboardingImage1,
          bgcolor: sPage2OnboardingColor,
          title: sOnboardingTitle2,
          subtitle: sOnboardingSubtitle2,
          counterText: sOnboardingCounter2,
        )
    ),

    OnboardingPageWidget(
        model: OnBoardingModel(
          image: sOnboardingImage1,
          bgcolor: sPage3OnboardingColor,
          title: sOnboardingTitle3,
          subtitle: sOnboardingSubtitle3,
          counterText: sOnboardingCounter3,
        )
    ),
  ];

  void onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

}