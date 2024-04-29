import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserData extends GetxController {
  // User data fields
  String? _userId;
  String? _displayName;
  String? _college;
  String? _major;

  String? get userId => _userId;

  String? get displayName => _displayName;

  String? get college => _college;

  String? get major => _major;

  Future<void> initializeUserDetails() async {
    final Completer<void> authInitialized = Completer<void>();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (!authInitialized.isCompleted) {
        authInitialized.complete();
      }
    });

    // Wait for Firebase Authentication to initialize
    await authInitialized.future;

    // Introduce a short delay before accessing currentUser

    final User? user = await FirebaseAuth.instance.currentUser;

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
          _userId = userId;
          _displayName = userData['fullName'];
          _college = userData['schoolName'];
          _major = userData['major'];
        }
      } else {}
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
  }
}
