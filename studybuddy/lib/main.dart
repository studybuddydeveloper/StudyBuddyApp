import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/firebase_options.dart';
import 'package:studybuddy/src/features/authentication/screens/welcome_screen.dart';
import 'package:studybuddy/src/repository/authentication_repository/authentication_repository.dart';

Widget buildSocialIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
              onTap: () {},
              child: Center(
                child: Icon(icon, size: 30),
              ))),
    );

void main() {
  //ensures that init of all widgets has been before loading of app?
  WidgetsFlutterBinding.ensureInitialized();
  //initializes firebase for the specific platform that the app is being run on
  //aka entry point for accessing firebase
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      //then we initialize the authentication repository
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Study Buddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
