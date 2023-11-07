import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../onboarding_screens/login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onpressed
  }) : super(key: key);

  final String image, title, subtitle;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          //make padding sizes constants
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              ///Title
              Text(
                "Your account has been created!",
                style: TextStyle(
                  fontSize: sDefaultSize * 2,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: sDefaultSize * 2),

              ///Subtitle
              Text(
                //todo takeout placeholder text
                "studybuddydeveloper@gmail.com",
                style: TextStyle(
                  fontSize: sDefaultSize * 1.2,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: sDefaultSize * 2),
              ///Description
              Text(
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
                child: ElevatedButton(onPressed: onpressed, child:
                Text(sContinueButton)),
              ),
            ],
          ),
        ),
      )
    );
  }
}
