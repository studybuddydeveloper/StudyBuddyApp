import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../time_selection_screen.dart';

class ScheduleGridWidget extends StatefulWidget {
  // print("hello world");
  @override
  _ScheduleGridWidgetState createState() => _ScheduleGridWidgetState();
}

class _ScheduleGridWidgetState extends State<ScheduleGridWidget> {
  String selectedStartTime = '9:00 AM'; // Example initial selection
  String selectedEndTime = '5:00 PM'; // Example initial selection

  @override
  Widget build(BuildContext context) {
    return Row(
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
        }),
      ],
    );
  }

  // Function to build a dropdown button
  Widget buildDropdownButton(
      String selectedValue, ValueChanged<String> onChanged) {
    print("hello world");

    // Replace the items list with your own data (e.g., list of times)
    List<String> items = ['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM'];

    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (value) => {
        Get.to(() => TimeScheduleSelectScreen()),
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

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Schedule Grid Example'),
//       ),
//       body: Center(
//         child: ScheduleGridWidget(),
//       ),
//     ),
//   ));
// }
