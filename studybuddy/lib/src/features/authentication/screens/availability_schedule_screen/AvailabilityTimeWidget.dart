import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/time_scheduling_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';

import '../widgets/appbar-widget.dart';

class ScheduleGridWidget extends StatefulWidget {
  @override
  _ScheduleGridWidgetState createState() => _ScheduleGridWidgetState();
}

/**
 * This widget creates time drop down for all available dates
 */
class _ScheduleGridWidgetState extends State<ScheduleGridWidget> {
  String selectedStartTime = '5:00PM'; // Example initial selection
  String selectedEndTime = '10:00PM'; // Example initial selection

  // a single var wont work since we haave multiple dates. Instead, we use a map
  // mapping each date's selected start and end times
  // Declare a map to store selected start times for each date
  Map<String, String> selectedStartTimes = {};

// Declare a map to store selected end times for each date
  Map<String, String> selectedEndTimes = {};
  List<String> items = [];

  List<String> userAvailability = [];
  String currDateString = "";

  late TimeSchedulingController _controller;

  @override
  Widget build(BuildContext context) {
    double middleElementWidth =
        MediaQuery.of(context).size.width * 1.3; // Adjust the factor as needed

    items = createListOfTimes(selectedStartTime, selectedEndTime);
    return Builder(
        builder: (context) => Scaffold(
              appBar: buildAppBar(
                // centerTitle: true,
                context,
                title: Text('Select your availability today!',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // align: 'center',
                    )),
                // Set the title text
                leading:
                    BackButton(onPressed: () => Get.to(() => ProfileScreen())),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  alignment: Alignment.center,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: middleElementWidth,
                              child: Container(), // Placeholder
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Implement logic to add a new date selection
                            },
                            icon: Icon(Icons.add),
                            label: Text('ADD DATE',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 30),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: middleElementWidth,
                              child: Container(), // Placeholder
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      //TODO: Extract this into a separate widget(the row part since it is repeated.)
                      // Method chosen is not currently working
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 220,
                              child: ElevatedButton(
                                  child: Text("Monday",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 30),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  // key: "Sunday",
                                  onHover: (True) => {},
                                  onPressed: () => {
                                        //add the date to the avail.string
                                        // currDateString += "Monday",
                                      }),
                            ),
                            SizedBox(width: 10),
                            // Spacer between text and dropdowns
                            // Start time dropdown button
                            buildDropdownButton(
                                selectedStartTimes["Monday"] ?? "5:00PM",
                                "Monday",
                                true),
                            // setState(() {
                            //   selectedStartTime = newValue;
                            //   currDateString += " ($newValue";
                            // });
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            buildDropdownButton(
                                selectedEndTimes["Monday"] ?? "10:00PM",
                                "Monday",
                                false),
                            // End time dropdown button
                            // availabilityTimes.add(currDateString),
                          ]),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 220,
                            child: ElevatedButton(
                                child: Text("Tuesday",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 30),
                                    shape: BeveledRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                // key: "Sunday",
                                onHover: (True) => {},
                                onPressed: () => {}),
                          ),
                          SizedBox(width: 10),
                          // Start time dropdown button
                          buildDropdownButton(
                              selectedStartTimes["Tuesday"] ?? "5:00PM",
                              "Tuesday",
                              true),
                          SizedBox(width: 10),
                          // Spacer between dropdowns
                          // Text 'till'
                          Text('till'),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // End time dropdown button
                          buildDropdownButton(
                              selectedEndTimes["Tuesday"] ?? "10:00PM",
                              "Tuesday",
                              false)
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 220,
                            child: ElevatedButton(
                                child: Text("Wednesday",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 30),
                                    shape: BeveledRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                // key: "Sunday",
                                onHover: (True) => {},
                                onPressed: () => {}),
                          ),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // Start time dropdown button
                          buildDropdownButton(
                              selectedStartTimes["Wednesday"] ?? "5:00PM",
                              "Wednesday",
                              true),
                          SizedBox(width: 10),
                          // Spacer between dropdowns
                          // Text 'till'
                          Text('till'),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // End time dropdown button
                          buildDropdownButton(
                              selectedEndTimes["Wednesday"] ?? "10:00PM",
                              "Wednesday",
                              false)
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 220,
                              child: ElevatedButton(
                                  child: Text("Thursday",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 30),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  // key: "Sunday",
                                  onHover: (True) => {},
                                  onPressed: () => {}),
                            ),
                            SizedBox(width: 10),

                            buildDropdownButton(
                                selectedStartTimes["Thursday"] ?? "5:00PM",
                                "Thursday",
                                true),
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            // Spacer between text and dropdowns
                            // End time dropdown button
                            buildDropdownButton(
                                selectedEndTimes["Thursday"] ?? "10:00PM",
                                "Thursday",
                                false)
                          ]),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Day of the week (e.g., Monday)
                          SizedBox(
                            width: 220,
                            child: ElevatedButton(
                                child: Text("Friday",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 30),
                                    shape: BeveledRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                // key: "Sunday",
                                onHover: (True) => {},
                                onPressed: () => {}),
                          ),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // Start time dropdown button
                          buildDropdownButton(
                              selectedStartTimes["Friday"] ?? "5:00PM",
                              "Friday",
                              true),
                          SizedBox(width: 10),
                          // Spacer between dropdowns
                          // Text 'till'
                          Text('till'),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns

                          buildDropdownButton(
                              selectedEndTimes["Friday"] ?? "10:00PM",
                              "Friday",
                              false),
                          // TODO: Check if the value for the start and end times selected is the same
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 220,
                              child: ElevatedButton(
                                  child: Text("Saturday",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 30),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  // key: "Sunday",
                                  onHover: (True) => {},
                                  onPressed: () => {}),
                            ),
                            SizedBox(width: 10),
                            // Spacer between text and dropdowns
                            // Start time dropdown button
                            buildDropdownButton(
                                selectedStartTimes['Saturday'] ?? "5:00PM",
                                "Saturday",
                                true),
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            buildDropdownButton(
                                selectedEndTimes['Saturday'] ?? "10:00PM",
                                "Saturday",
                                false)
                            // End time dropdown button
                          ]),
                      SizedBox(height: 20),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 220,
                              child: ElevatedButton(
                                  child: Text("Sunday",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 30),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  // key: "Sunday",
                                  onHover: (True) => {},
                                  onPressed: () => {}),
                            ),
                            // Text("Sunday"),
                            SizedBox(width: 10),
                            // Spacer between text and dropdowns
                            // Start time dropdown button
                            buildDropdownButton(
                                selectedStartTimes['Sunday'] ?? "5:00PM",
                                "Sunday",
                                true),
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            buildDropdownButton(
                                selectedEndTimes['Sunday'] ?? "10:00PM",
                                "Sunday",
                                false)
                            // End time dropdown button
                          ]),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: middleElementWidth,
                              child: Container(), // Placeholder
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => {
                              _controller = TimeSchedulingController(
                                  userAvailability: userAvailability),
                              _controller.saveAvailabilityToDatabase(),

                              // reset the user availability
                              userAvailability = []
                            },
                            child: Text("SUBMIT",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 30),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: middleElementWidth,
                              child: Container(), // Placeholder
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  /**
   * It takes in a selected value, and creates a drop down of times from that value.This is in increments of 30 minutes!
   */
  Widget buildDropdownButton(
      String selectedValue, String dayOfWeek, bool isStartTime) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      // Add padding

      // Decoration to add borders
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Set border color
        borderRadius: BorderRadius.circular(10), // Set border radius
        color: Colors.white, // Set background color to black
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        underline: Container(),
        onChanged: (String? newValue) => {
          // TODO: CHange this value to the updated value when it's changed on the screen
          setState(() {
            if (!isStartTime) {
              // print("new end is $newValue");
              // int.parse(selectedEndTimes[dayOfWeek]!.split(":")[0])
              selectedEndTimes[dayOfWeek] = newValue!;
              // currDateString += "-$newValue";
              var curr = selectedEndTimes[dayOfWeek];
              var cur = selectedStartTimes[dayOfWeek];
              userAvailability.add('$dayOfWeek $cur-$curr');

              print("the user availa: $userAvailability");
            } else {
              // print("hello word");
              // print("new value is $newValue");
              // currDateString += "$dayOfWeek $newValue";
              selectedStartTimes[dayOfWeek] = newValue!;
            }
          })
        },
        items: items.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                // TODO: change styling to default app styling
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/**
 * This function creates a list of times from the start time to the end time
 */
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
