import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/reusable_widgets/AvailabilityTimeWidget.dart';
import 'package:studybuddy/src/utils/theme/theme.dart';

Future<void> main() async {
  //ensures that init of all widgets has been before loading of app
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // //initializes firebase for the specific platform that the app is being run on
  // //aka entry point for accessing firebase
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     // // //then we initialize the authentication repository
  // .then((value) => Get.put(AuthenticationRepository()));
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
      //page transitions
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: ScheduleGridWidget(),
    );
  }
}
