import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    //todo require image
    required this.sWelcomeTitle,
    required this.sWelcomeSubtitle,
  }) : super(key: key);

  final String sWelcomeTitle, sWelcomeSubtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      //  Add image later
        Text(
          sWelcomeTitle, style: Theme.of(context).textTheme.displayMedium
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          sWelcomeSubtitle, style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
