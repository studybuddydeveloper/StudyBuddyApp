import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';

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
    return  Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
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
          ],
        ),
      )
    );
  }
}
