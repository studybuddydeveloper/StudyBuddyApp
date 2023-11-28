import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/update_profile_screen.dart';

import '../../../../utils/user_preferences.dart';
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

    return ThemeSwitchingArea(
        child: Builder(
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
                  ],
                ))));
  }
}

Widget buildName(modelUser.User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
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
            "${user.name}'s Note",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
//
// Widget buildAbout(User user) => Container(
//       padding: EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'About',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             user.about,
//             style: TextStyle(fontSize: 16, height: 1.4),
//           ),
//         ],
//       ),
//     );

//   leading: IconButton(
//       onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
//   title: Text(
//     uProfile,
//     style: Theme.of(context).textTheme.headlineMedium,
//   ),
//   actions: [
//     IconButton(
//         onPressed: () {},
//         icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
//   ],
// ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             _buildProfileHeader(),
//             // _buildAcademicInfo(),
//             // _buildSubjectsSection(),
//             // _buildAvailabilitySchedule(),
//             // _buildBioSection(),
//             // _buildContactInfo(),
//             // _buildPrivacySettings(),
//             // _buildRatingsAndReviews(),
//             // _buildAchievementsSection(),
//             // Add more sections as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _buildProfileHeader() {
//   return Container(
//     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
//     decoration: BoxDecoration(
//       color: Colors.white, // Adjust the background color as needed
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 2,
//           blurRadius: 5,
//           offset: Offset(0, 3),
//         ),
//       ],
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         const CircleAvatar(
//           radius: 50.0, // Adjust the size as needed
//           backgroundImage: NetworkImage(
//               'https://via.placeholder.com/150'), // Replace with actual image URL
//         ),
//         const SizedBox(width: 20.0),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'Username', // Replace with actual user name
//                 style: TextStyle(
//                   fontSize: 24.0, // Adjust the font size as needed
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 4.0),
//               Text(
//                 'College | Major | Year',
//                 // Replace with actual major and year
//                 style: TextStyle(
//                   fontSize: 18.0, // Adjust the font size as needed
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         IconButton(
//           icon: Icon(Icons.settings), // Settings or edit icon
//           onPressed: () {
//             // Handle settings or edit profile action
//           },
//         ),
//       ],
//     ),
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
//         title: Text(
//           uProfile,
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
//         ],
//       ),
//       body: SingleChildScrollView(
//           child: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           //PROFILE IMAGE
//           children: [
//             SizedBox(
//               width: 120,
//               height: 120,
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(100),
//                   child: const Image(image: AssetImage(tProfileImage))),
//             ),
//             const SizedBox(height: 10),
//
//             //PROFILE NAME
//             Text(uProfileName,
//                 style: Theme.of(context).textTheme.headlineMedium),
//
//             //PROFILE EMAIL
//             Text(uProfileEmail, style: Theme.of(context).textTheme.bodyMedium),
//
//             const SizedBox(height: 20),
//
//             // SOCIAL MEDIA BUTTONS
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 buildSocialIcon(FontAwesomeIcons.github),
//                 const SizedBox(width: 12),
//                 buildSocialIcon(FontAwesomeIcons.linkedin),
//                 const SizedBox(width: 12),
//               ],
//             ),
//             const SizedBox(height: 20),
//
//             //EDIT PROFILE BUTTON
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: sPrimaryColor,
//                     side: BorderSide.none,
//                     shape: const StadiumBorder()),
//                 child: const Text(uEditProfile,
//                     style: TextStyle(color: BlackColor)),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Divider(),
//             const SizedBox(height: 10),
//
//             //ABOUT ME SECTION
//             const Text(uProfileHeading,
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal)),
//
//             const SizedBox(
//               child: Text(uProfileDescription,
//                   style: TextStyle(color: BlackColor)),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
