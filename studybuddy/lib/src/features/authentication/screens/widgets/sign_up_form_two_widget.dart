import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/sign_up_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());
    bool sPasswordsMatch = true;
    bool sIsValidPassword = true;
    bool sisSchoolNameMissing = false;
    bool sisFullNameMissing = false;
    bool sIsValidEmail = true;
    bool sisPasswordMissing = false;
    // TODO: add validation for email
    String? _validateEmail(String value) {
      if (!value.endsWith('.edu')) {
        return 'Please enter a valid college email address ending with ".edu"';
      }
      return null;
    }


    return Container(
      padding: EdgeInsets.symmetric(vertical: sFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                // if (_formKey.currentState!.validate()) {
                print(value);
                  if (value!.isEmpty || !value.contains(" ")) {
                    setState(() {
                      sisFullNameMissing = true;
                    });
                    return 'Please enter your full name';
                  }
                  return null;
                // }
              },
              controller: controller.fullName,
              decoration: InputDecoration(
                label: Text(sFullName),
                prefixIcon: Icon(Icons.person),
                errorText: sisFullNameMissing ? 'Please enter your full name' : null,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:  sisFullNameMissing ? Colors.red: Colors.black
                  ), // Error border color
                ),
              ),
            ),

            SizedBox(height: sFormHeight - 20,),

            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full school name';
                }
                return null;
              },
                controller: controller.schoolName,
                decoration: InputDecoration(
                  label: Text(sSchoolName),
                  prefixIcon: Icon(Icons.school),
                  errorText: sisSchoolNameMissing ? 'Please enter your full school name' : null,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: sisFullNameMissing ? Colors.red: Colors.black
                    ), // Error border color
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: sisFullNameMissing ? Colors.red: Colors.black),
                  ),
                )
            ),

            SizedBox(height: sFormHeight - 20,),

            TextFormField(
              validator: (value) {
                    if (!value!.endsWith('.edu')) {
                      return 'Please enter a valid college email address ending with ".edu"';
                    }
                    return null;
              },
              controller: controller.email,
              decoration: InputDecoration(
                label: Text(sEmail),
                prefixIcon: Icon(Icons.email_rounded),
                errorBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                    color: sIsValidEmail ? Colors.red: Colors.black),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sIsValidEmail ? Colors.red: Colors.black),
                ),
                errorText: sIsValidEmail ? null: 'Please enter a valid college email '
                    'address ending with ".edu"',
              ),
            ),
            SizedBox(height: sFormHeight - 20,),

            TextFormField(

              validator: (value) {
                // if (_formKey.currentState!.validate()) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  // print(value.length);
                  // if (value.length < 6) {
                  //   // Set the _passwordsMatch variable to false if password length is less than 6
                  //   sIsValidPassword = false;
                  //   return 'Password must be at least 6 characters long';
                  // } else {
                    // Reset the _passwordsMatch variable if password length is valid
                  sIsValidPassword = true;
                  // }
                  return null;
                // }
              },
              controller: controller.password,
              decoration: InputDecoration(
                label: Text(sPassword),
                prefixIcon: Icon(Icons.remove_red_eye),
                errorText: sisPasswordMissing ? 'Please enter a password' : null,
                // Change the border color if the password length is invalid
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: sIsValidPassword ? Colors.black : Colors.red,
                  ),
                ),
              ),

            ),
            SizedBox(height: sFormHeight - 20,),

            TextFormField(
              validator: (value) {
                // if (_formKey.currentState!.validate()){
                  if (value != controller.password.text) {
                    sPasswordsMatch = false;
                    return "Passwords don't match";
                  }
                  return null;
                // };
                },
              controller: controller.confirmPassword,
              decoration: InputDecoration(
                label: Text(sConfirmPassword),
                errorText: sPasswordsMatch ? null : "Passwords don't match",
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sPasswordsMatch ? Colors.black : Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), // Focused error border color
                ),
              ),
            ),
            SizedBox(height: sFormHeight - 20,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    textStyle: Theme.of(context).textTheme.displayMedium
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    SignUpController.instance.registerUser(
                        controller.email.text,
                        controller.fullName.text,
                        controller.schoolName.text,
                        controller.password.text,
                        controller.confirmPassword.text);
                  }
                },
                child: Text(sSignupText.toUpperCase())
                ),
              ),
            ]
          )
        ),
      );
  }

  void setState(Null Function() param0) {

  }
}