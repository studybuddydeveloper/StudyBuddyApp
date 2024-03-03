import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/update_profile_screen.dart';

import '../../../../repository/authentication_repository/profile_repository.dart';
import '../../../../utils/Majors.dart';
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

  String fullName = '';
  String email = '';
  String college = '';
  String about = '';
  String major = '';
  String classYear = '';

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
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
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    const user = UserPreferences.myUser;
    // Get.put(ProfileRepository());
    controller.setUser();
    final m_controller = Get.put(Majors());
    // m_controller.addMajors();
    return Builder(
        builder: (context) => Scaffold(
            appBar: buildAppBar(context),
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
                const SizedBox(height: 48),
                buildAbout(user),
                // controller.getProfileInfo(),

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

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'message',
        onClicked: () {},
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

//
