import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    bool obscureText = true;
    // TODO: add validation for email
    String? _validateEmail(String value) {
      if (!value.endsWith('.edu')) {
        return 'Please enter a valid college email address ending with ".edu"';
      }
      return null;
    }


    return Container(
      padding: const EdgeInsets.symmetric(vertical: sFormHeight - 10),
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
                label: const Text(sFullName),
                prefixIcon: const Icon(Icons.person),
                errorText: sisFullNameMissing ? 'Please enter your full name' : null,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:  sisFullNameMissing ? Colors.red: Colors.black
                  ), // Error border color
                ),
              ),
            ),

            const SizedBox(height: sFormHeight - 20,),

            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full school name';
                }
                return null;
              },
                controller: controller.schoolName,
                decoration: InputDecoration(
                  label: const Text(sSchoolName),
                  prefixIcon: const Icon(Icons.school),
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

            const SizedBox(height: sFormHeight - 20,),

            TextFormField(
              validator: (value) {
                    if (!value!.endsWith('.edu')) {
                      return 'Please enter a valid college email address ending with ".edu"';
                    }
                    return null;
              },
              controller: controller.email,
              decoration: InputDecoration(
                label: const Text(sEmail),
                prefixIcon: const Icon(Icons.email_rounded),
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
            const SizedBox(height: sFormHeight - 20,),

            TextFormField(

              validator: (value) {
                // if (_formKey.currentState!.validate()) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  sIsValidPassword = true;
                  return null;
              },
              controller: controller.password,
              decoration: InputDecoration(
                label: const Text(sPassword),
                prefixIcon: const Icon(Icons.remove_red_eye),
                errorText: sisPasswordMissing ? 'Please enter a password' : null,
                // Change the border color if the password length is invalid
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: sIsValidPassword ? Colors.black : Colors.red,
                  ),
                ),
              ),

            ),
            const SizedBox(height: sFormHeight - 20,),

            TextFormField(
              obscureText: obscureText,
              validator: (value) {
                  if (value != controller.password.text) {
                    sPasswordsMatch = false;
                    return "Passwords don't match";
                  }
                  return null;
                },
              controller: controller.confirmPassword,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: IconButton(
                  icon: Icon( obscureText ? Icons.remove_red_eye: Icons.visibility_off),
                  onPressed: () {
                    // Toggle the password obscure state
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                label: const Text(sConfirmPassword),
                errorText: sPasswordsMatch ? null : "Passwords don't match",
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sPasswordsMatch ? Colors.black : Colors.red),
                  ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), // Focused error border color
                ),
              ),
            ),
            const SizedBox(height: sFormHeight - 20,),

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