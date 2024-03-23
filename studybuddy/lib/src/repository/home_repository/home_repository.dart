import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/user.dart';

import '../../features/authentication/controllers/profile_controller.dart';
import '../../features/authentication/models/UserAvailabilityModel.dart';
import '../authentication_repository/profile_repository.dart';

class HomeRepository extends GetxController {
  ProfileController _Pcontroller = ProfileController();

  // TimeSchedulingController _tController = TimeSchedulingController(userAvailability: userAvailability)
  String college = '';
  String uid = '';

  HomeRepository() {
    uid = _Pcontroller.getCurrentUserId();
  }

  /**
   * Default fetch based on college
   */
  Future<List<User_Main>> fetchSimilarUsersCollege() async {
    List<User_Main> users = [];

    Map<String, dynamic> userData = {};

    try {
      // Access the user data fields
      college = userData['schoolName'] ?? '';
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
            major: data['major']);
      }).toList();
      return users;
    } catch (e) {
      print('Error fetching similar users: $e');
    }
    return users;
  }

  /**
   * Default fetch based on college
   */
  Future<List<User_Main>> fetchUserProfileDefault() async {
    Map<String, dynamic> userData = {};

    try {
      // TODO save all this fields to a const page to prevent constant lookup
      userData = await ProfileRepository().getUserProfile(uid);

      // Access the user data fields
      college = userData['schoolName'] ?? '';
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
            major: data['major']);
      }).toList();
      return users;
    } catch (e) {
      // Handle errors or notify the user about the failure
      print('Error fetching user profile: $e');
    }
    return [];
  }

  /**
   * Fetch users based on default AND Availability
   */

  Future<List<User_Main>> fetchUsersAvailability() async {
    List<User_Main> users = [];

    // List<User_Main> defaultUsers = []
    // define the current user availability
    List<UserAvailabilityModel> currUserAvailability = [];
    // define the usersAvailability
    List<UserAvailabilityModel> usersAvailability = [];

    // query the time schedule collection for this specific user
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("time-schedule/${uid}/appointments")
        .get();

    // print("THE querysnap: ${querySnapshot.docs.first}");

    for (var coll in querySnapshot.docs) {
      Map<String, dynamic> data = coll.data() as Map<String, dynamic>;
      // print("My edata: ${data}");
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
    final List<User_Main> defaultUsers = await fetchUserProfileDefault();

    // now go through the availability of curr user
    //   for each of it's availability, if the start time and end time and date are
    // exactly the same with the current user, then add to the users lis

    for (UserAvailabilityModel model in currUserAvailability) {
      var day = model.dayOfWeek;
      var start = model.startTime;
      var end = model.endTime;

      // now we go through all the default users

      for (User_Main p_users in defaultUsers) {
        // get their own availability(poor cubic solution, will need to optimize later

        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("time-schedule/${p_users.uid}/appointments")
            .get();

        // print("THE querysnap: ${querySnapshot.docs.first}");

        for (var coll in querySnapshot.docs) {
          Map<String, dynamic> data = coll.data() as Map<String, dynamic>;
          // print("My edata: ${data}");
          if (data['dayOfWeek'] == day &&
              data['startTimeOfDay'] == start &&
              data['endTimeOfDay'] == end) {
            // first get the data of this user from users collection
            QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                .collection('users')
                .where(FieldPath.documentId, isEqualTo: p_users.uid)
                .get();

            // List<User_Main> users = querySnapshot.docs.map((doc) {
            //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            //   return User_Main(
            //       uid: doc.id,
            //       displayName: data['fullName'],
            //       college: data['schoolName'],
            //       major: data['major']);
            // }).toList();

            QueryDocumentSnapshot doc = querySnapshot.docs.first;
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            User_Main m = User_Main(
              uid: doc.id,
              displayName: data['fullName'],
              college: data['schoolName'],
              major: data['major'],
            );
            print(m.displayName);

            users.add(m);
          }
        }
      }
    }
    print("The currUser: $currUserAvailability");
    print(users);
    return users;
  }

  /**
   * TODO
   * Fetch users based on default AND meeting preference
   */

  Future<List<User_Main>> fetchUsersMeetingPref() async {
    List<User_Main> users = [];

    return users;
  }

  Future<List<User_Main>> getUsersInSameCollege(String college) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('college', isEqualTo: college)
        .where('')
        .get();

    List<User_Main> users = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User_Main(
          uid: doc.id,
          displayName: data['displayName'],
          college: data['schoolName'],
          major: data['major']);
    }).toList();
    return users;
  }
}
