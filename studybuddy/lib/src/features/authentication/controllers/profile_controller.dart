import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/profile_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final ProfileRepository p = Get.put(ProfileRepository());

  // Text filled controllers to retrieve profile details from user
  final fullName = TextEditingController();
  final email = TextEditingController();
  final college = TextEditingController();
  final about = TextEditingController();
  final major = TextEditingController();

  // Add the user's profile information here
  // right now we just have the multiple colleges info
  void addColleges() {
    ProfileRepository.instance.addMultipleColleges();
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
