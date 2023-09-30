import 'package:flutter/material.dart';
import 'package:studybuddy/src/constants/colors.dart';
import 'package:studybuddy/src/constants/image_strings.dart';
import 'package:studybuddy/src/constants/sizes.dart';
import 'package:studybuddy/src/constants/text_strings.dart';
import 'package:studybuddy/src/features/authentication/models/model_onboarding.dart';



import '../../models/model_onboarding.dart';class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    //obtaining the size of the device
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(sDefaultSize),
        color: model.bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //the height of the image is 50% of the screen height
            Image(image: AssetImage(model.image),
              height: size.height * 0.5,
            ),
            Column(
              children: [
                //TODO add const for default font styling
                Text(model.title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(model.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(model.counterText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.0,),
          ],
        )
    );
  }
}
