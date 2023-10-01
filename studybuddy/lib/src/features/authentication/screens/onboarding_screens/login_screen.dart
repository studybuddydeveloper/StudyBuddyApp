import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studybuddy/src/constants/colors.dart';
import 'package:studybuddy/src/constants/text_strings.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/main_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/sign_up_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/form_header_widget.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/login_form_widget.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //TODO add image
    /*
    final size= MediaQuery.of(context).size;

     */
    bool isIconVisible = false;

    void toggleIconVisibility() {
      isIconVisible = !isIconVisible;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),

              /* -- Header -- */
              const FormHeaderWidget(
                  sWelcomeTitle: sWelcomeTitle,
                  sWelcomeSubtitle: sWelcomeSubtitle
              ),

              /* -- Login FormText Fields -- */
              const LoginForm(),
              SizedBox(
                height: 10,
              ),

              /* -- Buttons -- */
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    sForgotPassword,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sSecondaryColor,
                  ),
                  onPressed: () => Get.to(() => MainScreen()),
                  child: Text(
                      sLoginText.toUpperCase(),
                      style: TextStyle(
                        color: sPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  sOr.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                  child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: sPrimaryColor,
                          side: BorderSide(
                            color: sSecondaryColor,
                          ),
                          foregroundColor: sSecondaryColor,
                        ),
                        onPressed: () {},
                        //TODO switch to google image
                        icon: Image(image: AssetImage(sGoogleLogo), width: 20),
                        label: Text(
                            sLoginWithGoogle.toUpperCase(),
                            /*todo set this to a const value*/
                            style: TextStyle(
                              color: sSecondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                    ),
                  ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        text: sDontHaveAnAccount,
                        children: [
                          TextSpan(
                            text: sSignupText,
                            style: TextStyle(
                            ),
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
