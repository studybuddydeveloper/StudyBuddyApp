import 'package:flutter/material.dart';

import '../features/authentication/screens/widgets/appbar-widget.dart';

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
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    items = createListOfTimes(selectedStartTime, selectedEndTime);
    return Builder(
        builder: (context) => Scaffold(
              appBar: buildAppBar(context),
              body: Scrollbar(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  alignment: Alignment.center,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                child: Text("Monday"),
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
                            SizedBox(width: 50),
                            // Spacer between text and dropdowns
                            // Start time dropdown button
                            buildDropdownButton(selectedStartTime, (newValue) {
                              setState(() {
                                selectedStartTime = newValue;
                              });
                            }),
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            buildDropdownButton(selectedEndTime, (newValue) {
                              setState(() {
                                selectedEndTime = newValue;
                              });
                              // Spacer between text and dropdowns
                              // End time dropdown button
                            })
                            // End time dropdown button
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              child: Text("Tuesday"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 30),
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              // key: "Sunday",
                              onHover: (True) => {},
                              onPressed: () => {}),
                          SizedBox(width: 10),
                          // Start time dropdown button
                          buildDropdownButton(selectedStartTime, (newValue) {
                            setState(() {
                              selectedStartTime = newValue;
                            });
                          }),
                          SizedBox(width: 10),
                          // Spacer between dropdowns
                          // Text 'till'
                          Text('till'),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // End time dropdown button
                          buildDropdownButton(selectedEndTime, (newValue) {
                            setState(() {
                              selectedEndTime = newValue;
                            });
                          })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              child: Text("Wednesday"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 30),
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              // key: "Sunday",
                              onHover: (True) => {},
                              onPressed: () => {}),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // Start time dropdown button
                          buildDropdownButton(selectedStartTime, (newValue) {
                            setState(() {
                              selectedStartTime = newValue;
                            });
                          }),
                          SizedBox(width: 10),
                          // Spacer between dropdowns
                          // Text 'till'
                          Text('till'),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // End time dropdown button
                          buildDropdownButton(selectedEndTime, (newValue) {
                            setState(() {
                              selectedEndTime = newValue;
                            });
                          })
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                child: Text("Thursday"),
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
                            SizedBox(width: 10),

                            buildDropdownButton(selectedStartTime, (newValue) {
                              setState(() {
                                selectedStartTime = newValue;
                              });
                            }),
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            // Spacer between text and dropdowns
                            // End time dropdown button
                            buildDropdownButton(selectedEndTime, (newValue) {
                              setState(() {
                                selectedEndTime = newValue;
                              });
                            })
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Day of the week (e.g., Monday)
                          ElevatedButton(
                              child: Text("Friday"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 30),
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              // key: "Sunday",
                              onHover: (True) => {},
                              onPressed: () => {}),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns
                          // Start time dropdown button
                          buildDropdownButton(selectedStartTime, (newValue) {
                            setState(() {
                              selectedStartTime = newValue;
                            });
                          }),
                          SizedBox(width: 10),
                          // Spacer between dropdowns
                          // Text 'till'
                          Text('till'),
                          SizedBox(width: 10),
                          // Spacer between text and dropdowns

                          buildDropdownButton(selectedEndTime, (newValue) {
                            setState(() {
                              selectedEndTime = newValue;
                            });
                            // TODO: Check if the value for the start and end times selected is the same
                            // End time dropdown button
                          })
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                child: Text("Saturday"),
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
                            SizedBox(width: 50),
                            // Spacer between text and dropdowns
                            // Start time dropdown button
                            buildDropdownButton(selectedStartTime, (newValue) {
                              setState(() {
                                selectedStartTime = newValue;
                              });
                            }),
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            buildDropdownButton(selectedEndTime, (newValue) {
                              setState(() {
                                selectedEndTime = newValue;
                              });
                              // Spacer between text and dropdowns
                              // End time dropdown button
                            })
                            // End time dropdown button
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                child: Text("Sunday"),
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
                            // Text("Sunday"),
                            SizedBox(width: 50),
                            // Spacer between text and dropdowns
                            // Start time dropdown button
                            buildDropdownButton(selectedStartTime, (newValue) {
                              setState(() {
                                selectedStartTime = newValue;
                              });
                            }),
                            SizedBox(width: 10),
                            // Spacer between dropdowns
                            // Text 'till'
                            Text('till'),
                            SizedBox(width: 10),
                            buildDropdownButton(selectedEndTime, (newValue) {
                              setState(() {
                                selectedEndTime = newValue;
                              });
                              // Spacer between text and dropdowns
                              // End time dropdown button
                            })
                            // End time dropdown button
                          ]),
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
      String selectedValue, ValueChanged<String> onChanged) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (value) => {
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
