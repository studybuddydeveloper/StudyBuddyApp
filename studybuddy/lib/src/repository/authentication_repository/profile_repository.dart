//this defines the backend for the profile page
//it includes the user's profile information
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileRepository extends GetxController {
  //this retrieves a single instance of the class profilerepository instead of calling
  // the class every time manually
  static ProfileRepository get instance => Get.find();

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
