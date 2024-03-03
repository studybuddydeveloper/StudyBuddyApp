import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/update_profile_screen.dart';

import '../../../../utils/Majors.dart';
import '../../../../utils/user_preferences.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user.dart' as modelUser;
import '../widgets/academicinfo_widget.dart';
import '../widgets/appbar-widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    const user = UserPreferences.myUser;
    // Get.put(ProfileRepository());
    final controller = Get.put(ProfileController());
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
                AcademicInfoWidget(),
                const SizedBox(height: 48),
                buildAbout(user),
                ElevatedButton(
                    child: Text("Go to Home"),
                    onPressed: () => controller.goToMainScreen())
              ],
            )));
  }
}

Widget buildName(modelUser.User user) => Column(
      children: [
        Text(
          ProfileController.instance.updatedFullName.value == ""
              ? 'Your Name'
              : "${ProfileController.instance.updatedFullName.value}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          '${ProfileController.instance.email.text}',
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
            ProfileController.instance.updatedFullName.value == ""
                ? 'Your Note'
                : "${ProfileController.instance.updatedFullName.value}'s Note",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            ProfileController.instance.updatedAbout.value == ""
                ? 'Add a note about yourself'
                : '${ProfileController.instance.updatedAbout.value}',
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
//
