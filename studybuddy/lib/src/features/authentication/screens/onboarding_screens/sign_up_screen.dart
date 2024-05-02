import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/constants/sizes.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/form_header_widget.dart';

import '../../../../constants/text_strings.dart';
import '../widgets/sign_up_form_two_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                const FormHeaderWidget(
                    sWelcomeTitle: sWelcomeTitle,
                    sWelcomeSubtitle: sWelcomeSubtitle),
                SignUpFormWidget(),
                const SizedBox(height: sFormHeight - 10),
                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      width: double.infinity,
                    ),
                    TextButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Text.rich(TextSpan(
                          children: [
                            TextSpan(
                                text: sAlreadyHaveAnAccount,
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(
                                text: sLoginText.toUpperCase(),
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        )))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
