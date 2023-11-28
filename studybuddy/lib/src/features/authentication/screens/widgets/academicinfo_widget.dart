import 'package:flutter/material.dart';

class AcademicInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildWrappedButton(context, 'College'),
          buildDivider(),
          buildWrappedButton(context, 'Major'),
          buildDivider(),
          buildWrappedButton(context, 'Year'),
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
