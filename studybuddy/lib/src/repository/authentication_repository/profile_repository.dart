//this defines the backend for the profile page
//it includes the user's profile information
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/profile_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:studybuddy/src/utils/User_Model.dart';

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

  //Saves the users profile information to the database
  Future<void> saveProfileInfo(String fullName, String email, String college,
      String about, String major, String classYear) async {
    User? user = auth.currentUser;

    //TODO Add the functionality to save the user's profile information
    // to the database of the assigned user
    print("my fullName: $fullName");
    final CollectionReference _usersCollection = FirebaseFirestore.instance
        .collection('users');
    try {
      await _usersCollection.doc(user?.uid).update(
          {
            'fullName': fullName,
            'email': email,
            'schoolName': college,
            'about': about,
            'major': major,
            'classYear': classYear,
          }
      );

      Get.to(() => const ProfileScreen());

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

  Future<UserModel> fetchExistingUserProfile(String email) async {
    //TODO Add the functionality to display the user's profile information
    final snapshot = await studyBuddyDB
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    final userData =
        snapshot.docs
            .map((doc) => UserModel.fromSnapshot(doc))
            .single;
    return userData;
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
