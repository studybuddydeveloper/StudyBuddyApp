import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:studybuddy/main.dart';
import 'package:studybuddy/src/constants/image_strings.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          uProfile,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          //PROFILE IMAGE
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(image: AssetImage(tProfileImage))),
            ),
            const SizedBox(height: 10),

            //PROFILE NAME
            Text(uProfileName,
                style: Theme.of(context).textTheme.headlineMedium),

            //PROFILE EMAIL
            Text(uProfileEmail, style: Theme.of(context).textTheme.bodyMedium),

            const SizedBox(height: 20),

            // SOCIAL MEDIA BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialIcon(FontAwesomeIcons.github),
                const SizedBox(width: 12),
                buildSocialIcon(FontAwesomeIcons.linkedin),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 20),

            //EDIT PROFILE BUTTON
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: sPrimaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(uEditProfile,
                    style: TextStyle(color: BlackColor)),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            //ABOUT ME SECTION
            const Text("About Me",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal)),

            const SizedBox(
              child: Text(uProfileDescription,
                  style: TextStyle(color: BlackColor)),
            )
          ],
        ),
      )),
    );
  }
}
