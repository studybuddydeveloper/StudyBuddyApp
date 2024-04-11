import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/login_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/home_screen_main.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/forget_password_model_bottom_sheet.dart';

import '../../../../constants/text_strings.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

bool isDarkTheme(BuildContext context) {
  var brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark;
}

class _LoginFormState extends State<LoginForm> {
  bool isIconVisible = true;

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    // var brightness = mediaQuery.platformBrightness;
    // var isDarkMode = Brightness.dark;

    final darkness = isDarkTheme(context);

    final formKey = GlobalKey<FormState>();

    final controller = Get.put(LoginController());
    return Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                controller: controller.email,
                decoration: const InputDecoration(
                  labelText: sEmail,
                  hintText: sEmailHint,
                  prefixIconColor: Colors.black,
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: isIconVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: controller.password,
                decoration: InputDecoration(
                    labelText: sPassword,
                    prefixIcon: Icon(
                      Icons.key_sharp,
                      color: darkness ? Colors.white : Colors.black,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isIconVisible = !isIconVisible;
                        });
                      },
                      icon: isIconVisible
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(Icons.visibility),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: sPassword),
              ),
              const SizedBox(
                height: 10,
              ),

              //FORGOT PASSWORD BTN
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ForgotPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(
                    sForgotPassword,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              //LOGIN BTN
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginWithEmailAndPassword(
                              controller.email.text, controller.password.text)
                          .then((value) {
                        if (value != null) {
                          Get.to(() => const HomeScreenMain());
                        } else {
                          Get.snackbar('Error', 'Error logging in');
                        }
                      });
                    }
                  },
                  child: Text(sLoginText.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ));
  }

  /**
   * TODO
   * Add a setstate method which will set the state of the textfields when wrong
   * user details has been entered.
   * Update the snackbar error message
   *
   */
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? firebaseUser;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseUser = userCredential.user;
      // Login successful, navigate to the next screen (e.g., the main screen).
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found for that email");
      } else if (e.code == 'wrong-password') {
        print("Wrong password provided for that user");
      }
    }
    return firebaseUser;
  }
}
