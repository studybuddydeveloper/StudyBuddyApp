import 'package:flutter/material.dart';

import '../features/authentication/screens/widgets/appbar-widget.dart';

class ScheduleGridWidget extends StatefulWidget {
  // print("hello world");
  @override
  _ScheduleGridWidgetState createState() => _ScheduleGridWidgetState();
}

/**
 * This widget creates time drop down for all available dates
 */
class _ScheduleGridWidgetState extends State<ScheduleGridWidget> {
  String selectedStartTime = '5:00PM'; // Example initial selection
  String selectedEndTime = '10:00PM'; // Example initial selection
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    items = createListOfTimes(selectedStartTime, selectedEndTime);
    return Builder(
        builder: (context) =>
            Scaffold(
              appBar: buildAppBar(context),
              body: Row(
                children: [
                  // Day of the week (e.g., Monday)
                  Text('Monday'),
                  SizedBox(width: 10), // Spacer between text and dropdowns
                  // Start time dropdown button
                  buildDropdownButton(selectedStartTime, (newValue) {
                    setState(() {
                      selectedStartTime = newValue;
                    });
                  }),
                  SizedBox(width: 10), // Spacer between dropdowns
                  // Text 'till'
                  Text('till'),
                  SizedBox(width: 10), // Spacer between text and dropdowns
                  // End time dropdown button
                  buildDropdownButton(selectedEndTime, (newValue) {
                    setState(() {
                      selectedEndTime = newValue;
                    });
                    // TODO: Check if the value for the start and end times selected is the same
                  }),
                ],
              ),
            ));
  }

  /**
   * It takes in a selected value, and creates a drop down of times from that value.This is in increments of 30 minutes!
   */
  Widget buildDropdownButton(String selectedValue,
      ValueChanged<String> onChanged) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (value) =>
      {
        // TODO: CHange this value to the updated value when it's changed on the screen
      },
      items: items.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

List<String> createListOfTimes(String startTime, String endTime) {
  List<String> times = [];

  int startHour = int.parse(startTime.split(":")[0]);
  int endHour = int.parse(endTime.split(":")[0]);
  for (int i = startHour; i <= endHour; i++) {
    times.add("$i:00PM");
    if (i == endHour) {
      break;
    }
    times.add("$i:30PM");
  }
  return times;
}