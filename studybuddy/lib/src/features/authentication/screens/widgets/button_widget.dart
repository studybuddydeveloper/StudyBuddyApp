// TODO Implement this library.
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.pinkAccent,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 22),
        ),
        onPressed: onClicked,
        child: Text(text),
      );
}
