import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/reusable_widgets/fade_in_animation_model.dart';

import 'fade_in_animation_controller.dart';

class SFadeInAnimationWidget extends StatelessWidget {
    SFadeInAnimationWidget ({
    Key? key,
    required this.durationInMs,
    required this.animate,
    required this.child,
  }) : super(key: key);

  final controller  = Get.put(FadeInAnimationController());
  final int durationInMs;
  final SAnimatePosition animate;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>  AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top: controller.animate.value ? animate.topAfter : animate.topBefore,
          left: controller.animate.value ? animate.leftAfter : animate.leftBefore,
          right: controller.animate.value ? animate.rightAfter : animate.rightBefore,
          bottom: controller.animate.value ? animate.bottomAfter : animate.bottomBefore,
          child:
          //    TODO image and icon need to have light and dark theme
          //to account for state of the app
          AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate.value ? 1 : 0,
            child: child,
      ),
    ),
    );
  }
}
