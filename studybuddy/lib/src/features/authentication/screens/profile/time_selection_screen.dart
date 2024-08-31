import 'package:flutter/material.dart';

class TimeScheduleSelectScreen extends StatefulWidget {
  const TimeScheduleSelectScreen({super.key});

  @override
  State<TimeScheduleSelectScreen> createState() =>
      _TimeScheduleSelectScreenState();
}

class _TimeScheduleSelectScreenState extends State<TimeScheduleSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Monday"),
        Text("Tuesday"),
        Text("Wednesday"),
        Text("Thursday"),
        Text("Friday"),
        Text("Saturday"),
        Text("Sunday"),
        ElevatedButton(
            onPressed: () {},
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add more dates",
              ),
            )),
      ],
    );
  }
}

// class TimeSelectionScreen extends GetxController{
//
//
// }
