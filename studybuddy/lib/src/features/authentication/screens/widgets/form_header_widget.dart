import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    //todo require image
    this.heightBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.sWelcomeTitle,
    required this.sWelcomeSubtitle, this.imageHeight,
    this.textAlign,
  }) : super(key: key);

  //Variab;es -- Declared in the constructor
  //todo add image color and image
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final double? imageHeight;
  final String sWelcomeTitle, sWelcomeSubtitle;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
      //  Add image later
        Text(
          sWelcomeTitle, style: Theme.of(context).textTheme.displayMedium
        ),
        SizedBox(
          height: heightBetween,
        ),
        Text(
          sWelcomeSubtitle, textAlign: textAlign, style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
