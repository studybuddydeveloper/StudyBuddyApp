import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/main_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:studybuddy/src/reusable_widgets/AvailabilityTimeWidget.dart';
import 'package:studybuddy/src/utils/UserAvailabilityModel.dart';

import '../../../../repository/authentication_repository/profile_repository.dart';
import '../../../../utils/Majors.dart';
import '../../../../utils/user_preferences.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user.dart' as modelUser;
import '../forgot_password_screens/chat_screens/chat_screen.dart';
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
      print(college);
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
    // controller.addMeetingMode();

    // controller.defaultValues();

    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    const user = UserPreferences.myUser;
    // Get.put(ProfileRepository());
    controller.setUser();
    final m_controller = Get.put(Majors());
    // m_controller.addMajors();
    return Builder(
        builder: (context) => Scaffold(
            appBar: buildAppBar(context,
                title: Text('Profile'),
                leading: BackButton(
                  onPressed: () => Get.offAll(() => MainScreen()),
                )),
            body: ListView(
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

                const SizedBox(height: 48),

                ElevatedButton(
                    onPressed: () => Get.offAll(() => UserAvailability()),
                    child: Text("Click to view your availability")),
                // controller.getProfileInfo(),
                const SizedBox(height: 48),
                ElevatedButton(
                    child: Text("Go to Home"),
                    onPressed: () => controller.goToMainScreen())
              ],
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
          Get.to(() => ChatScreen());
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
// Do some null checks here first to check if the availability pulled from the database
// does not exist

/**
 * Availability looks like a grid of cards
 * Monday | 5pm | 6pm |
 */
class _UserAvailability extends State<UserAvailability> {
  List<UserAvailabilityModel> userAvailability = [];

  @override
  Widget build(BuildContext context) {
    if (userAvailability.isEmpty) {
      return Builder(builder: (context) {
        return Scaffold(
            appBar: buildAppBar(context,
                title: Text("User's Availability"),
                leading: BackButton(
                    onPressed: () => Get.to(() => ScheduleGridWidget()))),
            body: ListView(children: [
              Text("Uh Oh, seems you haven't set your availability yet."
                  " Click the button below to begin!"),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: Text("Set up your availability"),
                onPressed: () => Get.to(() => ScheduleGridWidget()),
              )
            ]));
      });
    }

    return ListView.builder(
        itemCount: userAvailability.length,
        itemBuilder: (context, index) {
          UserAvailabilityModel availability = userAvailability[index];

          return ListTile(
            title: Text(availability.dayOfWeek),
            subtitle: Text('$availability.startTime - $availability.endTime'),
          );
        });
  }
}

//
//   Text(
//   'Your Availability',
//   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//   ),
//   const SizedBox(height: 4),
//   Row(children: [
//   SizedBox(
//   height: 100,
//   width: 100,
//   child: Text(
//   "$dayOfWeek",
//   ),
//   ),
//   SizedBox(width: 50),
//   SizedBox(
//   height: 100,
//   width: 100,
//   child: Text(
//   "$startTime",
//   ),
//   ),
//   SizedBox(
//   height: 100,
//   width: 100,
//   child: Text(
//   "$endTime",
//   ),
//   ),
//   ])
//   ],
