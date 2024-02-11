import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/profile_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // Add the user's profile information here
  // right now we just have the multiple colleges info
  void addProfileInfo() {
    ProfileRepository.instance.addMultipleColleges();
  }
}
