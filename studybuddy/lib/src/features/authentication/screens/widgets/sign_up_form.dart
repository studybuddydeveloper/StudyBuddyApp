import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/sign_up_controller.dart';

class SignUpFormWidget extends StatefulWidget {
  SignUpFormWidget({Key? key}) : super(key: key);

  @override
  _SignUpFormWidgetState createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool _obscurePasswordText = true;
  bool _obscureCpasswordText = true;
  final _formKey = GlobalKey<FormState>();

  // Your other code...

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    bool sPasswordsMatch = true;
    bool sIsValidPassword = true;
    bool sisSchoolNameMissing = false;
    bool sisFirstNameMissing = false;
    bool sIsLastNameMissing = false;
    bool sIsValidEmail = true;
    bool sisPasswordMissing = false;
    bool obscureText = true;
    bool isIconVisible = false;
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  setState(() {
                    sisFirstNameMissing = true;
                  });
                  return 'Please enter your first name';
                }
                return null;
                // }
              },
              controller: controller.firstName,
              decoration: InputDecoration(
                label: const Text(sFirstName),
                prefixIcon: const Icon(Icons.person),
                errorText:
                    sisFirstNameMissing ? 'Please enter your first name' : null,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sisFirstNameMissing
                          ? Colors.red
                          : Colors.black), // Error border color
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  setState(() {
                    sIsLastNameMissing = true;
                  });
                  return "Please enter your last name";
                }
              },
              controller: controller.lastName,
              decoration: InputDecoration(
                label: const Text(sLastName),
                prefixIcon: const Icon(Icons.person),
                errorText:
                    sIsLastNameMissing ? 'Please enter your last name' : null,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sIsLastNameMissing
                          ? Colors.red
                          : Colors.black), // Error border color
                ),
              ),
            ),
            const SizedBox(
              height: sFormHeight - 20,
            ),
            TextFormField(
              // validator: (value) {
              //       if (!value!.endsWith('.edu')) {
              //         return 'Please enter a valid college email address ending with ".edu"';
              //       }
              //       return null;
              // },
              controller: controller.email,
              decoration: InputDecoration(
                label: const Text(sEmail),
                prefixIcon: const Icon(Icons.email_rounded),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sIsValidEmail ? Colors.red : Colors.black),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sIsValidEmail ? Colors.red : Colors.black),
                ),
                errorText: sIsValidEmail
                    ? null
                    : 'Please enter a valid college email '
                        'address ending with ".edu"',
              ),
            ),
            const SizedBox(
              height: sFormHeight - 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              controller: controller.password,
              obscureText: _obscurePasswordText,
              decoration: InputDecoration(
                  label: Text(sPassword),
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePasswordText = !_obscurePasswordText;
                      });
                    },
                    icon: _obscurePasswordText
                        ? const Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )),
              // Your other code...
            ),
            const SizedBox(
              height: sFormHeight - 20,
            ),
            TextFormField(
              obscureText: _obscureCpasswordText,
              validator: (value) {
                if (value!.isEmpty || value != controller.password.text) {
                  sPasswordsMatch = false;
                  return "Passwords don't match";
                }
                return null;
              },
              controller: controller.confirmPassword,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(_obscureCpasswordText
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    // Toggle the password obscure state
                    setState(() {
                      _obscureCpasswordText = !_obscureCpasswordText;
                    });
                    // icon
                  },
                ),
                label: const Text(sConfirmPassword),
                errorText: sPasswordsMatch ? null : "Passwords don't match",
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: sPasswordsMatch ? Colors.black : Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red), // Focused error border color
                ),
              ),
            ),
            const SizedBox(
              height: sFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: Theme.of(context).textTheme.displayMedium),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SignUpController.instance.registerUser(
                          controller.firstName.text,
                          controller.lastName.text,
                          controller.email.text,
                          controller.password.text,
                          controller.confirmPassword.text);
                    }
                  },
                  child: Text(sSignupText.toUpperCase())),
            ),
            SizedBox(
              height: 30,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton.icon(
            //     style: OutlinedButton.styleFrom(
            //         // side: const BorderSide(
            //         //   color: sSecondaryColor,
            //         // ),
            //         // foregroundColor: sSecondaryColor,
            //         ),
            //     onPressed: () async {
            //       var value = AuthenticationRepository.signInWithGoogle(
            //           context: context);
            //       if (value != null) {
            //         Get.to(() => const MainScreen());
            //       } else {
            //         Get.snackbar('Error', 'Error logging in');
            //       }
            //     },
            //     //TODO switch to google image
            //     icon: const Image(image: AssetImage(sGoogleLogo), width: 20),
            //     label: Text(sLoginWithGoogle.toUpperCase(),
            //         /*todo set this to a const value*/
            //         style: const TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         )),
            //   ),
            // ),
          ])),
    );
  }
}
