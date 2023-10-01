import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/src/constants/image_strings.dart';
import 'package:studybuddy/src/constants/sizes.dart';
import 'package:studybuddy/src/constants/text_strings.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/sign_up_screen.dart';

import 'package:studybuddy/src/features/authentication/screens/widgets/sign_up_form_widget.dart';
import 'package:studybuddy/src/reusable_widgets/fade_in_animation_widget.dart';
import 'package:studybuddy/src/utils/theme/theme.dart';

import '../../../../constants/colors.dart';
import '../../../../reusable_widgets/fade_in_animation_controller.dart';
import '../../../../reusable_widgets/fade_in_animation_model.dart';
import '../onboarding_screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  //TODO: might need to set platform default sizing for images individually.
  @override
  Widget build(BuildContext context) {
    final controller = FadeInAnimationController();
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? sSecondaryColor : sPrimaryColor,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
                //TODO change study buddy image to just a logo
                //TODO define app theme and logo
                image: AssetImage(sWelcomeScreenImage),
                height: height * 0.5,
                // width: width * 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    sWelcomeTitle,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? sSecondaryColor : sPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0,),
                Text(
                    sWelcomeSubtitle,
                    style: Theme.of(context).textTheme.displaySmall
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to(LoginScreen()),
                    child: Text(
                        sLoginText.toUpperCase(),
                        style: TextStyle(
                        // color: sLoginButtonColorText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(SignUpScreen()),
                    child: Text(
                      sSignupText.toUpperCase(),
                      style: TextStyle(
                        // color: sSignupButtonColorText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ),
              ],
            ),
          //  1st child for the welcome image
          //  2nd child for the welcome title
          //  3rd child for the welcome subtitle
          //  4th child for the login and sign up buttons
          ],
        )
      )
    );
  }

  void setState(Null Function() param0) {}
}


