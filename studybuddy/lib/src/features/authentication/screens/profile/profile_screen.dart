import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/sign_up_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/availability_schedule_screen/AvailabilityTimeWidget.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/home_screen_main.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/welcome_screen.dart';
import 'package:studybuddy/src/utils/TimeScheduler.dart';
import 'package:studybuddy/src/utils/UserAvailabilityModel.dart';

import '../../../../repository/authentication_repository/profile_repository.dart';
import '../../../../utils/user_preferences.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user.dart' as modelUser;
import '../widgets/academicinfo_widget.dart';
import '../widgets/appbar-widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());

  // const ProfileScreen({super.key});
  String userId = '';
  Map<String, dynamic> userData = {};

  String meetingMode = '';
  String fullName = '';
  String email = '';
  String college = '';
  String about = '';
  String major = '';
  String classYear = '';

  late String dayOfWeek = '';
  late String startTime = '';
  late String endTime = '';

  late Map<String, String> selectedStartTimes = {};

// Declare a map to store selected end times for each date
  late Map<String, String> selectedEndTimes = {};

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  String getFullName() {
    return fullName;
  }

  String getEmail() {
    return email;
  }

  String getCollege() {
    return college;
  }

  String getAbout() {
    return about;
  }

  String getMajor() {
    return major;
  }

  String getClassYear() {
    return classYear;
  }

  Future<void> fetchUserProfile() async {
    try {
      // TODO save all this fields to a const page to prevent constant lookup
      userId = controller.getCurrentUserId();
      userData = await ProfileRepository().getUserProfile(userId);

      // Access the user data fields
      fullName = userData['fullName'] ?? '';
      email = userData['email'] ?? '';
      college = userData['schoolName'] ?? '';
      about = userData['about'] ?? '';
      major = userData['major'] ?? '';
      classYear = userData['classYear'] ?? '';

      // Now, you can use these variables in your UI
      setState(() {}); // Trigger a rebuild to reflect the updated data
    } catch (e) {
      // Handle errors or notify the user about the failure
      print('Error fetching user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    controller.setUser();
    return Builder(
        builder: (context) => Scaffold(
            appBar: buildAppBar(
              context,
              title: Text('Profile'),
              leading: BackButton(onPressed: () {
                Navigator.pop(context);
              }),
              actions: [
                PopupMenuButton(
                  color: Colors.white,
                  // backgroundColor: Colors.white,
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.red),
                            // Logout icon
                            SizedBox(width: 10),
                            Text('Logout', style: TextStyle(color: Colors.red)),
                            // Set text color to red for logout
                          ],
                        ),
                        value: 'logout',
                      ),
                    ];
                  },
                  onSelected: (value) {
                    switch (value) {
                      case 'logout':
                        // Handle logout action
                        Get.offAll(() => WelcomeScreen());
                        break;
                    }
                  },
                ),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  buildName(user),
                  const SizedBox(height: 24),
                  Center(child: buildUpgradeButton()),
                  const SizedBox(height: 24),
                  AcademicInfoWidget(
                      college: college, major: major, classYear: classYear),
                  const SizedBox(height: 24),
                  buildMeetingMode(user),
                  const SizedBox(height: 48),
                  buildAbout(user),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.to(UserAvailability()),
                          child: Text("View Availability",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.to(const HomeScreenMain()),
                          child: Text("Home",
                              style: const TextStyle(
                                // color: sSignupButtonColorText,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  tooltip: 'Home',
                  icon: Icon(Icons.home),
                  label: 'Home',
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
              // currentIndex: _selectedIndex,
              // onTap: _onItemTapped,
            )));
  }

  Widget buildName(modelUser.User user) => Column(
        children: [
          Text(
            fullName == "" ? 'Your Name' : fullName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            email == "" ? 'Your Email' : email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildMeetingMode(modelUser.User user) => Column(
        children: [
          Text(
            meetingMode == "I prefere meeting $meetingMode"
                ? 'Your Meeting Preference'
                : meetingMode,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'message',
        onClicked: () {
          // Get.to(() => ChatScreen());
        },
      );

  Widget buildAbout(modelUser.User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName == "" ? 'Your Note' : "$fullName's Note",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              about == "" ? 'Add a note about yourself' : '$about',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

class UserAvailability extends StatefulWidget {
  @override
  _UserAvailability createState() => _UserAvailability();
}

/**
 * Availability looks like a grid of cards
 * Monday | 5pm | 6pm |
 */
class _UserAvailability extends State<UserAvailability> {
  List<UserAvailabilityModel> userAvailability = [];
  final authController = Get.put(SignUpController());

  final TimeScheduler timeScheduler =
      TimeScheduler(uid: ProfileController.instance.getCurrentUserId());

  @override
  Widget build(BuildContext context) {
    double middleElementWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
        appBar: buildAppBar(context, title: Text('User Profile'),
            leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }), actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Profile'),
                  value: 'profile',
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      // Logout icon
                      SizedBox(width: 10),
                      Text('Logout', style: TextStyle(color: Colors.red)),
                      // Set text color to red for logout
                    ],
                  ),
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 'Home':
                  // Handle home action
                  Get.to(() => HomeScreenMain());
                  break;
                case 'profile':
                  // Handle profile action
                  Get.to(() => ProfileScreen());
                  break;

                case 'logout':
                  // Handle logout action
                  authController.logOut();
                  break;
              }
            },
          ),
        ]),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
                child: FutureBuilder<List<UserAvailabilityModel>>(
                    // future: Obx(() => timeScheduler.getUserAppointments()),
                    future: timeScheduler.getUserAppointments(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print("waiting");
                        return CircularProgressIndicator(
                          color: Colors.black,
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData.isBlank!) {
                        return Column(
                          children: [
                            Text(
                                "Uh Oh, looks like you've not set your availability yet"
                                "Click below to continue"),
                            SizedBox(height: 50),
                            ElevatedButton(
                                onPressed: () =>
                                    Get.to(() => ScheduleGridWidget()),
                                child: Text("Add your availability"))
                          ],
                        );
                      } else {
                        final appointments = snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: appointments.length,
                                itemBuilder: (context, index) {
                                  final appointment = appointments[index];
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                            'Date: ${appointment.dayOfWeek}'),
                                        subtitle: Text(
                                            'Start: ${appointment.startTime} - End: ${appointment.endTime}'),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 50,
                              ),
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
                                  OutlinedButton(
                                    onPressed: () =>
                                        Get.to(() => ScheduleGridWidget()),
                                    child: Text("Update your availability",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 30),
                                        shape: BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
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
                        );
                      }
                    })),
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
                  Get.to(() => ProfileScreen());
                },
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
        ));
  }
}
