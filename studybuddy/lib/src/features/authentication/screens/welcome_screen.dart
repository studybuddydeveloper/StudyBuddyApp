import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:studybuddy/src/features/authentication/screens/mainscreen.dart';

import '../controllers/welcomecontroller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  //_ represents private variables
  bool _isFullName = true;
  bool _isValidEduEmail = true;

  //Checks if the email is a valid .edu email
  bool isEduEmail(String email) {
    // Validate the email format first
    if (!EmailValidator.validate(email)) {
      _isValidEduEmail =  false;
    }

    // Define a regular expression pattern to match ".edu" domains
    RegExp regex = RegExp(r"@[A-Za-z0-9._%+-]+\.edu$");

    // Use the RegExp's hasMatch method to check if the email matches the pattern
    return regex.hasMatch(email);
  }

  //Checks if the user has entered a full name
  bool isFullName(String name) {
    if (name.contains(' ')) {
      _isFullName = true;
    }
    return _isFullName;
  }

  void validateEmail(String inputEmail) {
    final isValidFormat = EmailValidator.validate(inputEmail);
    final hasEduDomain = inputEmail.endsWith('.edu');

    setState(() {
      email = inputEmail;
      isInvalidFormat = !isValidFormat;
      isInvalidDomain = !hasEduDomain;
    });
  }


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
              SignupForm(),
              SizedBox(height: 20),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}


