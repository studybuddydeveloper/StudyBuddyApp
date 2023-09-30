import 'package:flutter/material.dart';
import 'package:studybuddy/src/features/authentication/screens/widgets/sign_up_form_widget.dart';
import 'package:studybuddy/src/utils/theme/theme.dart';
import 'package:studybuddy/src/utils/theme/widget_themes/text_theme.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      title: 'Signup and Login Forms',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Signup and Login Forms'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello World"),
              SignupForm(),
              SizedBox(height: 20),
              // LoginForm(),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}


