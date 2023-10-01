import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: sFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text(sFullName),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: sFormHeight - 20,),
            TextFormField(
                decoration: InputDecoration(
                  label: Text(sSchoolName),
                  prefixIcon: Icon(Icons.school),
                )
            ),
            SizedBox(height: sFormHeight - 20,),
            TextFormField(
              decoration: InputDecoration(
                label: Text(sEmail),
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            SizedBox(height: sFormHeight - 20,),

            TextFormField(
              decoration: InputDecoration(
                label: Text(sPassword),
                prefixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
            SizedBox(height: sFormHeight - 20,),
            TextFormField(
              decoration: InputDecoration(
                label: Text(sConfirmPassword),
              ),
            ),
          ],
        ),
      ),
    );
  }
}