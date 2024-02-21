import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/button_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //eventually, this mainscreen will invoke mainscreenwidget class
    //as we don't want our design logic to be where we're handling the data i.e the models
    return Container(
        child: ButtonWidget(
      text: ("Click me!"),
      onClicked: () {
        Get.to(() => const ProfileScreen());
      },
    ));

    // ]);
  }
}
