//this defines the backend for the profile page
//it includes the user's profile information
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/profile_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';

class ProfileRepository extends GetxController {
  //this retrieves a single instance of the class profilerepository instead of calling
  // the class every time manually
  static ProfileRepository get instance => Get.find();
  late final Rx<User?> firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  // TODO: Add the user's profile information here

  // final CollectionReference _usersCollection =
  //     FirebaseFirestore.instance.collection('users');
  final studyBuddyDB = FirebaseFirestore.instance;

  final CollectionReference _collegeCollection =
      FirebaseFirestore.instance.collection('colleges');

  final CollectionReference _majorsCollection =
      FirebaseFirestore.instance.collection('majors');

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  List<Map<String, dynamic>> collegesList = [
    {
      'college_id': 'mount_holyoke_college',
      'college_name': 'Mount Holyoke College',
      'state': 'Massachusetts',
      'country': 'United States',
    },
    {
      'college_id': 'amherst_college',
      'college_name': 'Amherst College',
      'state': 'Massachusetts',
      'country': 'United States',
    },
    {
      'college_id': 'smith_college',
      'college_name': 'Smith College',
      'state': 'Massachusetts',
      'country': 'United States',
    },
    {
      'college_id': 'hampshire_college',
      'college_name': 'Hampshire College',
      'state': 'Massachusetts',
      'country': 'United States',
    },
    {
      'college_id': 'umass_amherst_university',
      'college_name': 'University of Massachusetts Amherst',
      'state': 'Massachusetts',
      'country': 'United States',
    }
  ];

  //adds multiple colleges to the colleges collection
  void addMultipleColleges() {
    //add each college to the colleges collection
    collegesList.forEach((college) {
      _collegeCollection
          .add(college)
          .then((value) => print("College Added"))
          .catchError((error) => print("Failed to add college: $error"));
    });
  }

  void addMeetingMode() {
    _usersCollection
        .add({
          'meetingMode': 'in-person',
          'meetingMode': 'virtual',
        })
        .then((value) => print("Meeting Mode Added"))
        .catchError((error) => print("Failed to add meeting mode: $error"));
  }

  //Saves the users profile information to the database
  Future<void> saveProfileInfo(String fullName, String email, String college,
      String about, String major, String classYear) async {
    User? user = auth.currentUser;

    //TODO Add the functionality to save the user's profile information
    // to the database of the assigned user
    try {
      await _usersCollection.doc(user?.uid).update({
        'fullName': fullName,
        'email': email,
        'schoolName': college,
        'about': about,
        'major': major,
        'classYear': classYear,
      });

      Get.to(() => ProfileScreen());

      // Update GetX controller values
      ProfileController.instance.updatedFullName.value = fullName;
      ProfileController.instance.updatedEmail.value = email;
      ProfileController.instance.updatedCollege.value = college;
      ProfileController.instance.updatedAbout.value = about;
      ProfileController.instance.updatedMajor.value = major;
      ProfileController.instance.updatedClassYear.value = classYear;
    } catch (e) {
      print('Error updating user profile: $e');
    }
    // FirebaseFirestore.instance.collection('users').doc().set({
    //   'fullName': fullName,
    //   'email': email,
    //   'schoolName': college,
    //   'about': about,
    //   'major': major,
    //   'classYear': classYear,
    // });

    //TODO Have a check to determine if the saving was successful
  }

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    //TODO Add the functionality to display the user's profile information

    try {
      DocumentSnapshot userSnapshot = await _usersCollection.doc(userId).get();

      if (userSnapshot.exists) {
        // Convert the document snapshot data to a map
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        return userData;
      } else {
        // Handle the case when the user document does not exist
        return {};
      }
    } catch (e) {
      // Handle errors or notify the user about the failure
      print('Error fetching user profile: $e');
      return {};
    }
  }
// final Colleges MountHolyokeCollege = Colleges(
//   college_id: 'mount_holyoke_college',
//   college_name: 'Mount Holyoke College',
//   state: 'Massachusetts',
//   country: 'United States',
// );
//
// final Colleges AmherstCollege = Colleges(
//   college_id: 'amherst_college',
//   college_name: 'Amherst College',
//   state: 'Massachusetts',
//   country: 'United States',
// );
//
// final Colleges SmithCollege = Colleges(
//   college_id: 'smith_college',
//   college_name: 'Smith College',
//   state: 'Massachusetts',
//   country: 'United States',
// );
//
// final Colleges HampshireCollege = Colleges(
//   college_id: 'hampshire_college',
//   college_name: 'Hampshire College',
//   state: 'Massachusetts',
//   country: 'United States',
// );
//
// final Colleges UmassAmherstCollege = Colleges(
//   college_id: 'umass_amherst_college',
//   college_name: 'University of Massachusetts Amherst',
//   state: 'Massachusetts',
//   country: 'United States',
// );
}
