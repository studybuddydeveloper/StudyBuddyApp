import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/user.dart';

import '../../features/authentication/controllers/profile_controller.dart';
import '../authentication_repository/profile_repository.dart';

class HomeRepository {
  ProfileController _Pcontroller = ProfileController();
  String college = '';

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<User>> fetchUserProfile() async {
    print("hello");
    String uid = _Pcontroller.getCurrentUserId();

    // final uid = _auth.currentUser!.uid;
    Map<String, dynamic> userData = {};

    try {
      // TODO save all this fields to a const page to prevent constant lookup
      // userId = controller.getCurrentUserId();
      userData = await ProfileRepository().getUserProfile(uid);

      // Access the user data fields
      college = userData['schoolName'] ?? '';
      print("my $college");
      getUsersInSameCollege(college);
      // about = userData['about'] ?? '';
      // major = userData['major'] ?? '';
      // classYear = userData['classYear'] ?? '';
      //
      // // Now, you can use these variables in your UI
      // setState(() {}); // Trigger a rebuild to reflect the updated data

      // fetchUserProfile();
      print("The college $college");

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('college', isEqualTo: college)
          .get();

      List<User> users = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User(
          uid: doc.id,
          displayName: data['displayName'],
          college: data['college'],
          // "monday (3-5)"
          // "monday": ["2-7"]
          // Add other user details as needed
        );
      }).toList();
      print(" the users dislay $users");
      return users;
    } catch (e) {
      // Handle errors or notify the user about the failure
      print('Error fetching user profile: $e');
    }
    return [];
  }

  Future<List<User>> getUsersInSameCollege(String college) async {
    // fetchUserProfile();
    print("The college $college");

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('college', isEqualTo: college)
        .get();

    List<User> users = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User(
        uid: doc.id,
        displayName: data['displayName'],
        college: data['college'],
        // Add other user details as needed
      );
    }).toList();
    print(" the users dislay $users");
    return users;
  }
}
