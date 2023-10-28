import 'package:flutter/material.dart';
import 'package:studybuddy/src/constants/sizes.dart';
import 'package:studybuddy/src/constants/text_strings.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/form_header_widget.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  const ForgetPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:  EdgeInsets.all(sDefaultSize),
            child: Column(
              children: [
                SizedBox(
                  height: sDefaultSize * 3,
                ),
                FormHeaderWidget(
                    //todo: add image'
                    crossAxisAlignment: CrossAxisAlignment.center,
                    heightBetween: sDefaultSize * 2,
                    textAlign: TextAlign.center,
                    sWelcomeTitle: sForgotPasswordTitle,
                    sWelcomeSubtitle: sForgotPasswordSubtitle),
                SizedBox(
                  height: sDefaultSize * 2,
                ),
                Form(child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: sEmail,
                        labelText: sEmail,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: sDefaultSize * 2,
                ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(sNext),
                      ),
                    )
                  ]
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
