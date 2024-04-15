import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/user.dart';

import '../../features/authentication/controllers/profile_controller.dart';
import '../../features/authentication/models/UserAvailabilityModel.dart';
import '../../utils/User_Data.dart';

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  ProfileController _Pcontroller = ProfileController();

  // final UserData _userData = Get.find<UserData>();

  late final UserData userData;

  HomeRepository({required this.userData}) {}

  // TimeSchedulingController _tController = TimeSchedulingController(userAvailability: userAvailability)
  String college = '';
  String uid = '';
  String major = '';

  @override
  onInit() {
    super.onInit();

    uid = userData.userId!;
    major = userData.major!;
    college = userData.college!;
  }

  /**
   * Default fetch based on college
   */
  Future<List<User_Main>> fetchUsersInSameCollege() async {
    // Map<String, dynamic> userData = {};
    try {
      // TODO save all this fields to a const page to prevent constant lookup
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('schoolName', isEqualTo: college)
          .where(FieldPath.documentId, isNotEqualTo: uid)
          .get();

      List<User_Main> users = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User_Main(
            uid: doc.id,
            displayName: data['fullName'],
            college: data['schoolName'],
            major: data['major'],
            about: data['about']);
      }).toList();
      return users;
    } catch (e) {
      print('Error fetching user profile: $e');
    }
    return [];
  }

  /**
   * Default fetch based on filters
   */
  Future<List<User_Main>> fetchUsersBasedFilters(List<String> names) async {
    List<User_Main> users = [];

    // for each filter name in names,
    // append a where to the query

    return users;
  }

  /**
   * Default fetch based on major
   */
  Future<List<User_Main>> fetchUsersWithSameMajor(String? major) async {
    List<User_Main> users = [];

    try {
      // Access the user data fields
      // college = userData['schoolName'] ?? '';
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('major', isEqualTo: major)
          .where(FieldPath.documentId, isNotEqualTo: uid)
          .get();
      List<User_Main> users = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User_Main(
            uid: doc.id,
            displayName: data['fullName'],
            college: data['schoolName'],
            major: data['major'],
            about: data['about']);
      }).toList();
      return users;
    } catch (e) {
      print('Error fetching similar users: $e');
    }
    return users;
  }

  /**
   * TODO
   * Fetch users based on default AND meeting preference
   */

  Future<List<User_Main>> fetchUsersWithSameMeetingPref() async {
    List<User_Main> users = [];
    Map<String, dynamic> userData = {};

    try {
      // Access the user data fields
      college = userData['schoolName'] ?? '';

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('meeting-preference', isEqualTo: college)
          .where('')
          .get();
    } catch (e) {
      print('Error fetching similar users: $e');
    }

    return users;
  }

  /**
   * Fetch users based on default AND Availability
   * TODO Add error handling
   */
  Future<List<User_Main>> fetchUsersWithSameAvailability() async {
    List<User_Main> users = [];

    List<UserAvailabilityModel> currUserAvailability = [];
    // define the usersAvailability
    List<UserAvailabilityModel> usersAvailability = [];

    // query the time schedule collection for this specific user
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("time-schedule/${uid}/appointments")
        .get();

    for (var coll in querySnapshot.docs) {
      Map<String, dynamic> data = coll.data() as Map<String, dynamic>;
      UserAvailabilityModel model = UserAvailabilityModel(
        dayOfWeek: data['dayOfWeek'],
        startTime: data['startTimeOfDay'],
        endTime: data['endTimeOfDay'],
      );
      currUserAvailability.add(model);
    }

    //this is a list of availability for the users

    // now, we rely on existing methods to get all the users from the same
    // defaults as the curr user
    final List<User_Main> defaultUsers = await fetchUsersInSameCollege();

    for (UserAvailabilityModel model in currUserAvailability) {
      var day = model.dayOfWeek;
      var start = model.startTime;
      var end = model.endTime;

      // now we go through all the default users

      // TODO check if the default user is not in the RETURNED list already
      // TODO update the list by removing users already matched from defaultusers
      // TODO can utilize two lists
      for (User_Main p_users in defaultUsers) {
        // get their own availability(poor cubic solution, will need to optimize later

        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("time-schedule/${p_users.uid}/appointments")
            .get();

        for (var coll in querySnapshot.docs) {
          Map<String, dynamic> data = coll.data() as Map<String, dynamic>;

          //Lines 180 - 182, invocation should be an invocation of the user availablity model
          // the user availability models will do the comparison

          // might end up with duplicates because of multiple overlaps with the same
          // user
          if (data['dayOfWeek'] == day &&
              data['startTimeOfDay'] == start &&
              data['endTimeOfDay'] == end) {
            // first get the data of this user from users collection
            QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                .collection('users')
                .where(FieldPath.documentId, isEqualTo: p_users.uid)
                .get();

            QueryDocumentSnapshot doc = querySnapshot.docs.first;
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

            User_Main m = User_Main(
              uid: doc.id,
              displayName: data['fullName'],
              college: data['schoolName'],
              major: data['major'],
              about: data['about'],
            );
            users.add(m);
          }
        }
      }
    }
    return users;
  }
}
