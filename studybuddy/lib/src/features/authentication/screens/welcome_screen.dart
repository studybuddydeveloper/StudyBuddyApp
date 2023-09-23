import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/login_form_widget.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/sign_up_form_widget.dart';

import '../controllers/sign_up_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup and Login Forms',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signup and Login Forms'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello World"),
              SignupForm(),
              SizedBox(height: 20),
              // LoginForm(),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}


