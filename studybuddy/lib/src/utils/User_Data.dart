import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier {
  // User data fields
  String? _userId;
  String? _displayName;
  String? _college;
  String? _major;

  String? get userId => _userId;

  String? get displayName => _displayName;

  String? get college => _college;

  String? get major => _major;

  AuthProvider() {
    initializeUserDetails();
  }

  Future<void> initializeUserDetails() async {
    final User? user = FirebaseAuth.instance.currentUser;

    try {
      // TODO save all this fields to a const page to prevent constant lookup

      // Access the user data fields
      if (user != null) {
        String userId = user.uid;

        // Assuming you're using Firestore
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (doc.exists) {
          Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;

          String displayName = userData['fullName'];
          String college = userData['schoolName'];
          String major = userData['major'];
          setUserDetails(userId, displayName, college, major);
        }
      }
    } catch (e) {
      // Handle errors or notify the user about the failure
      print('Error fetching user profile: $e');
    }
  }

  void setUserDetails(
      String userId, String displayName, String college, String major) {
    _userId = userId;
    _displayName = displayName;
    _college = college;
    _major = major;
    notifyListeners();
  }
}
