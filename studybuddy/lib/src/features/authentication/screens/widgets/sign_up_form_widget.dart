import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sign_up_controller.dart';
import '../main_screens/main_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  //_ represents private variables
  final bool _isFullName = false;
  final bool _isInValidEmailFormat = false;
  bool _isInvalidEduEmail = false;
  bool _isInValidFullName = false;
  String _fullnameErrorMessage = '';
  final String _emailaddress = '';

  // Timer to delay validation
  late Timer _debounce;

  @override
  void initState() {
    super.initState();
    // Initialize the timer with a delay of 500 milliseconds
    _debounce = Timer(const Duration(milliseconds: 10), () {});
  }

  //Checks if the email is a valid .edu email
// Checks if the email is a valid .edu email
  void isEduEmail(String email) {
    // Define a regular expression pattern to match ".edu" domains
    RegExp regex = RegExp(r"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$");

    // Use the RegExp's hasMatch method to check if the email matches the pattern
    if (regex.hasMatch(email)) {
      // Check if the domain is ".edu"
      if (email.endsWith(".edu")) {
        _isInvalidEduEmail = false;
      } else {
        _isInvalidEduEmail = true;
      }
    } else {
      _isInvalidEduEmail = true;
    }
  }

  // Checks if the user has entered a full name
  void isFullName(String name) {
    // Split the name by spaces
    final nameParts = name.trim().split(' ');

    // Check if there are at least two name parts (first name and last name)
    if (nameParts.length >= 2) {
      _isInValidFullName = false;
      _fullnameErrorMessage = '';
    } else if (name.isEmpty) {
      _isInValidFullName = true;
      _fullnameErrorMessage = 'Fullname cannot be empty';
    } else {
      _isInValidFullName = true;
      _fullnameErrorMessage = 'Please enter your full name';
    }
  }

  //Checks if the user has entered a valid .edu email
  void validateEmail(String inputEmail) {
    // Debounce the email validation to wait for user input to settle
    _debounce.cancel(); // Cancel the previous timer if it exists
    isEduEmail(_emailaddress);
    setState(() {
      _isInvalidEduEmail;
      _isInValidEmailFormat;
    });
  }

  //Checks if the user has entered a valid .edu email
  void validateFullName(String fullName) {
    isFullName(fullName);
    setState(() {
      _isInValidFullName;
    });
  }

  @override
  void dispose() {
    // Dispose of the timer when the widget is removed
    _debounce.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //calling the controller that retrieves the user input from text fields
    final controller = Get.put(SignUpController());
    //creates a unique key for identifying and managing the state of a form widget
    // in your Flutter application. This key is used to interact with and validate
    // the form's input fields.
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            //TODO: add validation for email
            //TODO: Create constants for email and password label
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: controller.fullName,
              onFieldSubmitted: (value) {
                validateFullName(value);
              },
              decoration: InputDecoration(
                labelText: 'Full Name',
                errorText: _isInValidFullName ? _fullnameErrorMessage : null,
              ),
              obscureText: false,
              textCapitalization: TextCapitalization.words,
              textDirection: TextDirection.ltr,
            ),
            TextFormField(
              controller: controller.email,
              onFieldSubmitted: (value) {
                validateEmail(value);
              },
              scrollController: ScrollController(),
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _isInValidEmailFormat
                    ? 'Invalid email format'
                    : _isInvalidEduEmail
                        ? 'Must be a .edu email'
                        : null,
              ),
              textCapitalization: TextCapitalization.none,
              textDirection: TextDirection.ltr,
            ),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              validator: (value) {
                if (value != controller.password.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              controller: controller.confirmPassword,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.fullName.text.trim(),
                      controller.schoolName.text.trim(),
                      controller.password.text.trim(),
                      controller.fullName.text.trim());
                  Get.to(() => const MainScreen());
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
