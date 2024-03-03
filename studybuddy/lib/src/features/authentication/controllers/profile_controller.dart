import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/profile_repository.dart';

import '../screens/main_screens/main_screen.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final ProfileRepository _profileRepo = Get.put(ProfileRepository());
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  // Get the current user's UID
  String getCurrentUserId() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String uid = user.uid;
      return uid;
    } else {
      // Handle the case when the user is not signed in
      // You might want to navigate to the login screen or take appropriate action
      return '';
    }
  }

  void setUser() {
    user = auth.currentUser;
    email = TextEditingController(text: user!.email);
    print(email.text);
  }

  void goToMainScreen() {
    Get.to(() => MainScreen());
  }

  // Text filled controllers to retrieve profile details from user
  final fullName = TextEditingController();
  var email = TextEditingController();
  final college = TextEditingController();
  final about = TextEditingController();
  final major = TextEditingController();
  final classYear = TextEditingController();

  RxString updatedFullName = ''.obs;
  RxString updatedEmail = ''.obs;
  RxString updatedCollege = ''.obs;
  RxString updatedAbout = ''.obs;
  RxString updatedMajor = ''.obs;
  RxString updatedClassYear = ''.obs;

  // Add the user's profile information here
  // right now we just have the multiple colleges info
  void addColleges() {
    ProfileRepository.instance.addMultipleColleges();
  }

  void setEmail() {
    email = TextEditingController(text: user!.email);
    print(email);
  }

  void saveProfileInfo(String fullName, String email, String college,
      String about, String major, String classYear) {
    print("my name is $fullName");
    ProfileRepository.instance
        .saveProfileInfo(fullName, email, college, about, major, classYear);
  }

  getProfileInfo() {
    final userId = getCurrentUserId();
    _profileRepo.getUserProfile(userId);
    // final email = _profileRepo.firebaseUser.value!.email;
    // if (email != null) {
    //   return _profileRepo.fetchExistingUserProfile(email);
    // } else {
    //   Get.snackbar("Error", "Login to continue");
    // }
  }
}
