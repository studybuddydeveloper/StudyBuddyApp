import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/login_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/onboarding_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/splash_screens/splash_screeten.dart';

import 'package:studybuddy/src/features/authentication/screens/welcome_screens/welcome_screen.dart';
import 'package:studybuddy/src/repository/authentication_repository/authentication_repository.dart';
import 'package:studybuddy/src/utils/theme/theme.dart';

import 'firebase_options.dart';

void main() {
  //ensures that init of all widgets has been before loading of app
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
      title: 'Study Buddy',
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}


