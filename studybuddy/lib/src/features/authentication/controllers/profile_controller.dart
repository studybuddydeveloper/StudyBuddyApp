import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/profile_repository.dart';

import '../screens/main_screens/main_screen.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  void setUser() {
    user = auth.currentUser;
    email = TextEditingController(text: user!.email);
    print(email.text);
  }

  void goToMainScreen() {
    Get.to(() => MainScreen());
  }

  final ProfileRepository p = Get.put(ProfileRepository());

  // Text filled controllers to retrieve profile details from user
  final fullName = TextEditingController();
  var email = TextEditingController();
  final college = TextEditingController();
  final about = TextEditingController();
  final major = TextEditingController();

  RxString updatedFullName = ''.obs;
  RxString updatedEmail = ''.obs;
  RxString updatedCollege = ''.obs;
  RxString updatedAbout = ''.obs;

  // Add the user's profile information here
  // right now we just have the multiple colleges info
  void addColleges() {
    ProfileRepository.instance.addMultipleColleges();
  }

  void setEmail() {
    email = TextEditingController(text: user!.email);
    print(email);
  }

  void saveProfileInfo(
      String fullName, String email, String college, String about) {
    print("my name is $fullName");
    ProfileRepository.instance.saveProfileInfo(
      fullName,
      email,
      college,
      about,
    );
  }
}
