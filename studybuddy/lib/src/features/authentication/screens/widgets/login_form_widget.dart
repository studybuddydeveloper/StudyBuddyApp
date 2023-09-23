import 'package:flutter/material.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Yayy the user has logged in/yayy the user has signed up',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      )
    );
  }
}
