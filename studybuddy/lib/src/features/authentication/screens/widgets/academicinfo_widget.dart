import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class AcademicInfoWidget extends StatelessWidget {
  final String college;
  final String major;
  final String classYear;

  AcademicInfoWidget({
    Key? key,
    required this.college,
    required this.major,
    required this.classYear,
  }) : super(key: key);
  final controller = Get.put(ProfileController());

  //TODo add default values for texts
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildWrappedButton(
            context,
            college == '' ? 'College' : college,
          ),
          buildDivider(),
          buildWrappedButton(context, major == '' ? 'Major' : major),
          buildDivider(),
          buildWrappedButton(context, major == '' ? 'Class Year' : classYear),
        ],
      );

  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildWrappedButton(BuildContext context, String text) =>
      GestureDetector(
        onTap: () {
          // Implement your onTap functionality
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            softWrap: true, // Allow text to wrap inside the button
          ),
        ),
      );
}
