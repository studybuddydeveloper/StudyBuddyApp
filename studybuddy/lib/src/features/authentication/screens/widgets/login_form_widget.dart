import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studybuddy/src/features/authentication/controllers/login_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';
import '../main_screens/main_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});


  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool isIconVisible = false;

  void toggleIconVisibility() {
    isIconVisible = !isIconVisible;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final controller = Get.put(LoginController());
    return  Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || !value.contains(" ")) {
                  return 'Please enter your full name';
                }
                return null;
            },
              controller: controller.email,
              decoration: InputDecoration(
                labelText: sEmail,
                hintText: sEmailHint,
                prefixIcon: Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            controller: controller.password,
            decoration: InputDecoration(
                labelText: sPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    toggleIconVisibility();
                  },
                  icon: isIconVisible ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.visibility),
                ),
                border: OutlineInputBorder(),
                hintText: sPassword
            ),
          ),
          SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: sSecondaryColor,
                ),
                onPressed: () => Get.to(() => MainScreen()),
                child: Text(
                    sLoginText.toUpperCase(),
                    style: TextStyle(
                      color: sPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
