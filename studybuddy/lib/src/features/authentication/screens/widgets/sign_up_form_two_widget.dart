import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/authentication_repository.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/sign_up_controller.dart';
import '../main_screens/main_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({
    super.key,
  });
  static final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());
    bool sPasswordsMatch = true;
    bool sIsValidPassword = true;
    bool sisSchoolNameMissing = false;
    bool sisFullNameMissing = false;
    bool sIsValidEmail = true;
    bool sisPasswordMissing = false;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: sFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
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
                    // if (!value!.endsWith('.edu')) {
                    //   return 'Please enter a valid college email address ending with ".edu"';
                    // }
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
              obscureText: !passwordVisible,
              validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  sIsValidPassword = true;
                  return null;
              },
              controller: controller.password,
              decoration: InputDecoration(
                label: const Text(sPassword),
                prefixIcon: IconButton(
                  icon: Icon(passwordVisible ? Icons.visibility: Icons.visibility_off),
                  onPressed: () {
                    print("button pressed");
                    // Toggle the password obscure state
                      passwordVisible = !passwordVisible;
                    print('Password visibility toggled: $passwordVisible');

                  },
                ),
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
              obscureText: !passwordVisible,
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
                  icon: Icon( passwordVisible ? Icons.visibility: Icons.visibility_off),
                  onPressed: () {
                    // Toggle the password obscure state
                      passwordVisible = !passwordVisible;
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
            SizedBox(
              height: 30,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton.icon(
            //     style: OutlinedButton.styleFrom(
            //       backgroundColor: sPrimaryColor,
            //       side: const BorderSide(
            //         color: sSecondaryColor,
            //       ),
            //       foregroundColor: sSecondaryColor,
            //     ),
            //     onPressed: () async {
            //       var value = AuthenticationRepository.signInWithGoogle(context: context);
            //       if (value != null) {
            //         Get.to(() => const MainScreen());
            //       } else {
            //         Get.snackbar('Error', 'Error logging in');
            //       }
            //     },
            //     //TODO switch to google image
            //     icon: const Image(image: AssetImage(sGoogleLogo), width: 20),
            //     label: Text(
            //         sLoginWithGoogle.toUpperCase(),
            //         /*todo set this to a const value*/
            //         style: const TextStyle(
            //           color: sSecondaryColor,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         )
            //     ),
            //   ),
            // ),
            ]
          )
        ),
      );
  }

  void setState(Null Function() param0) {

  }
}