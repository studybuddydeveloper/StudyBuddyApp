import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/constants/colors.dart';
import 'package:studybuddy/src/constants/text_strings.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/sign_up_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/form_header_widget.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/login_form_widget.dart';

import '../../../../constants/image_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO add image
    /*
    final size= MediaQuery.of(context).size;

     */

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    bool isIconVisible = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 50,
              ),

              /* -- Header -- */
              const FormHeaderWidget(
                  sWelcomeTitle: sWelcomeTitle,
                  sWelcomeSubtitle: sWelcomeSubtitle),

              /* -- Login FormText Fields -- */
              const LoginForm(),
              const SizedBox(
                height: 10,
              ),

              /* -- Buttons -- */
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  sOr.toUpperCase(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  //TODO switch to google image
                  icon: const Image(image: AssetImage(sGoogleLogo), width: 20),
                  label: Text(sLoginWithGoogle.toUpperCase(),
                      /*todo set this to a const value*/
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () => Get.to(() => const SignUpScreen()),
                  child: const Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 20, color: sSecondaryColor),
                      text: sDontHaveAnAccount,
                      children: [
                        TextSpan(
                          text: sSignupText,
                          style: TextStyle(color: sSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
