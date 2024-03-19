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
                    )), // Set the title text
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
                                  onPressed: () => {}),
                            ),
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
                            buildDropdownButton(selectedEndTime, (newValue) {
                              setState(() {
                                selectedEndTime = newValue;
                              });
                              // Spacer between text and dropdowns
                              // End time dropdown button
                            })
                            // End time dropdown button
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
                            onPressed: () => {},
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
      String selectedValue, ValueChanged<String> onChanged) {
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
        onChanged: (value) => {
          // TODO: CHange this value to the updated value when it's changed on the screen
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
