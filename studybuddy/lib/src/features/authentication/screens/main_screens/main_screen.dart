import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/screens/home_screens/home_screen_main.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:studybuddy/src/repository/authentication_repository/authentication_repository.dart';

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
    return Column(
      children: [
        Container(
            child: ElevatedButton(
          child: Text("Go to Profile Page"),
          onPressed: () {
            Get.to(() => ProfileScreen());
          },
        )),
        SizedBox(
          height: 40,
        ),
        Container(
            child: ElevatedButton(
          child: Text("Logout!"),
          onPressed: () {
            AuthenticationRepository.instance.logout();
          },
        )),
        Container(
            child: ElevatedButton(
          child: Text("Main Screen!"),
          onPressed: () {
            Get.to(() => HomeScreen());
          },
        )),
      ],
    );

    // ]);
  }
}
