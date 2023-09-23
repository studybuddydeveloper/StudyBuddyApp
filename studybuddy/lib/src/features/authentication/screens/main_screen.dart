import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //eventually, this mainscreen will invoke mainscreenwidget class
    //as we don't want our design logic to be where we're handling the data i.e the models
    return const Placeholder(
      child: Text(""
          "Yayy the user has logged in/yayy the user has signed up")
    );
  }
}
