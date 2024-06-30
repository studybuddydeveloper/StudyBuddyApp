import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/sign_up_controller.dart';
import 'package:studybuddy/src/features/authentication/controllers/time_scheduling_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';

import '../main_screens/home_screen_main.dart';
import '../widgets/appbar-widget.dart';

class ScheduleGridWidget extends StatefulWidget {
  @override
  _ScheduleGridWidgetState createState() => _ScheduleGridWidgetState();
}

class _ScheduleGridWidgetState extends State<ScheduleGridWidget> {
  final SignUpController authController = Get.put(SignUpController());
  String selectedStartTime = '5:00PM'; // Example initial selection
  String selectedEndTime = '10:00PM'; // Example initial selection

  Map<String, String?> selectedStartTimes = {
    'Monday': null,
    'Tuesday': null,
    'Wednesday': null,
    'Thursday': null,
    'Friday': null,
    'Saturday': null,
    'Sunday': null,
  };

  Map<String, String?> selectedEndTimes = {
    'Monday': null,
    'Tuesday': null,
    'Wednesday': null,
    'Thursday': null,
    'Friday': null,
    'Saturday': null,
    'Sunday': null,
  };
  List<String> items = [];

  List<String> userAvailability = [];
  String currDateString = "";

  late TimeSchedulingController _controller;

  @override
  void initState() {
    super.initState();
    items = createListOfTimes(selectedStartTime, selectedEndTime);
  }

  @override
  Widget build(BuildContext context) {
    double middleElementWidth =
        MediaQuery.of(context).size.width * 1.3; // Adjust the factor as needed

    return Scaffold(
        appBar: buildAppBar(
          context,
          title: Text('Select your availability today!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          }),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text('Profile', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    value: 'profile',
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 10),
                        Text('Logout', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    value: 'logout',
                  ),
                ];
              },
              onSelected: (value) {
                switch (value) {
                  case 'Home':
                    Get.to(() => HomeScreenMain());
                    break;
                  case 'logout':
                    authController.logOut();
                    break;
                  case 'profile':
                    Get.to(() => ProfileScreen());
                    break;
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: middleElementWidth,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                for (var day in [
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                  'Saturday',
                  'Sunday'
                ])
                  buildDayRow(day),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: middleElementWidth,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bool isValid = true;
                        String errorMessage = '';
                        selectedStartTimes.forEach((day, startTime) {
                          if (startTime != null &&
                              selectedEndTimes[day] != null) {
                            if (int.parse(
                                    selectedEndTimes[day]!.split(":")[0]) <=
                                int.parse(startTime.split(":")[0])) {
                              isValid = false;
                              errorMessage =
                                  'End time cannot be earlier or the same as start time for $day';
                            }
                          }
                        });
                        if (isValid) {
                          _controller = TimeSchedulingController(
                              userAvailability: userAvailability);
                          _controller.saveAvailabilityToDatabase();
                          userAvailability = [];
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(errorMessage),
                          ));
                        }
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
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              tooltip: 'Home',
              icon: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Get.to(() => HomeScreenMain());
                  }),
              label: '',
            ),
            BottomNavigationBarItem(
              tooltip: 'Availability',
              icon: IconButton(
                  icon: Icon(Icons.event_available),
                  onPressed: () {
                    Get.to(() => UserAvailability());
                  }),
              label: 'Availability',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
              tooltip: 'Coming Soon!',
            ),
            BottomNavigationBarItem(
              tooltip: 'Profile',
              icon: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Get.to(() => ProfileScreen());
                },
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
        ));
  }

  Widget buildDayRow(String day) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 220,
          child: ElevatedButton(
            child: Text(day,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
          ),
        ),
        SizedBox(width: 10),
        buildDropdownButton(selectedStartTimes[day] ?? "5:00PM", day, true),
        SizedBox(width: 10),
        Text('till'),
        SizedBox(width: 10),
        buildDropdownButton(selectedEndTimes[day] ?? "10:00PM", day, false),
      ],
    );
  }

  Widget buildDropdownButton(
      String selectedValue, String dayOfWeek, bool isStartTime) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: isStartTime
            ? Colors.white
            : (selectedEndTimes[dayOfWeek] != null &&
                    selectedStartTimes[dayOfWeek] != null &&
                    int.parse(selectedEndTimes[dayOfWeek]!.split(":")[0]) <=
                        int.parse(selectedStartTimes[dayOfWeek]!.split(":")[0])
                ? Colors.red
                : Colors.white),
      ),
      child: DropdownButton<String>(
        value: selectedValue.isNotEmpty ? selectedValue : '',
        underline: Container(),
        onChanged: (String? newValue) {
          if (newValue != selectedValue) {
            setState(() {
              if (!isStartTime) {
                selectedEndTimes[dayOfWeek] = newValue!;
                var curr = selectedEndTimes[dayOfWeek];
                var cur = selectedStartTimes[dayOfWeek];
                if (int.parse(curr!.split(":")[0]) <=
                    int.parse(cur!.split(":")[0])) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('End time cannot be earlier than start time'),
                  ));
                } else {
                  userAvailability.add('$dayOfWeek $cur-$curr');
                }
              } else {
                selectedStartTimes[dayOfWeek] = newValue!;
              }
            });
          }
        },
        items: items.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
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
}
