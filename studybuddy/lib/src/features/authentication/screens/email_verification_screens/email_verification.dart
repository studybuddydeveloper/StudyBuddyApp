import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/constants/sizes.dart';
import 'package:studybuddy/src/constants/text_strings.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/login_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/success_screens/success_screen.dart';
class EmailVerificationScreen extends StatelessWidget {
   const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // removes back button
        actions: [
          IconButton(
          //  todo
          //  when the user presses the clear button, they are taken
          //  to the onboarding screen where they're shown how to navigate the app
          //  or should this be after logging in??
          onPressed: () => Get.offAll(() => const LoginScreen()),
          icon: const Icon(CupertinoIcons.clear)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(sDefaultSize),
            child: Column(
              children: [
                ///Verify image here todo
                // Image(
                //   image: AssetImage("assets/images/verify_email.png"),
                //   width: sDefaultSize * 0.6,
                // )
                 const SizedBox(height: sDefaultSize * 2),
                ///Title
                const Text(
                  sConfirmEmail,
                  style: TextStyle(
                    fontSize: sDefaultSize * 2,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: sDefaultSize * 2),

                ///Subtitle
                const Text(
                  //todo takeout placeholder text
                  "studybuddydeveloper@gmai.com",
                  style: TextStyle(
                    fontSize: sDefaultSize * 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: sDefaultSize * 2),
                ///Description
                const Text(
                  //todo takeout placeholder text
                  "Congratulations...",
                  style: TextStyle(
                    fontSize: sDefaultSize * 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                ///Buttons
                SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                        image: 'helloo',
                        title: 'title',
                        subtitle: 'subtitle',
                        onpressed: () => Get.to(() => const LoginScreen()))
                    ),
                    child: const Text(sContinueButton)),
                    ),

                SizedBox(width: double.infinity,
                  child: TextButton(onPressed: (){}, child:
                  const Text(sResendEmail)),
                )

              ],
            )
      ),
    )
    );
  }
}
