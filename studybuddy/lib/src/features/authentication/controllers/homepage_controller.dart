import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/profile_controller.dart';
import 'package:studybuddy/src/repository/home_repository/home_repository.dart';

import '../../../repository/users_repository/users_repository.dart';
import '../../../utils/User_Data.dart';
import '../screens/main_screens/user.dart';

/**
 * This controller fetches data from the database to be displayed on the home screen
 */
class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  final firestoreService = Get.put(FirestoreService());

  late HomeRepository homeRepository;

  final pController = Get.put(ProfileController());

  final UserData userData;

  HomeScreenController({required this.userData}) {
    homeRepository = Get.put(HomeRepository(userData: userData));
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  String? college = '';
  String? major = '';

  List<User_Main> users =
      []; //list of users that match the current user's defns
  @override
  Future<void> onInit() async {
    super.onInit();
    college = await firestoreService.getCurrentUserCollege();
    major = await firestoreService.getCurrentUserMajor();
  }

  /**
   * This fetches users from the database that are in the same college as the current user
   */
  Future<List<User_Main>> fetchUsersInSameCollege() async {
    List<User_Main> usersInSameCollege = [];
    if (college != null) {
      usersInSameCollege = await homeRepository.fetchUsersInSameCollege();

      if (usersInSameCollege.isNotEmpty) {
      } else {
        print('No users found in the same college.');
      }
    } else {
      print('Unable to retrieve current user college.');
    }

    return usersInSameCollege;
  }

  /**
   * This fetches users from the database that are in the same major as the current user
   */
  Future<List<User_Main>> fetchUsersInSameMajor() async {
    List<User_Main> usersInSameMajor = [];

    if (major != null) {
      usersInSameMajor =
          await homeRepository.fetchUsersWithSameMajor(userData.major);

      if (usersInSameMajor.isNotEmpty) {
      } else {
        print('No users found in the same college.');
      }
    } else {
      print('Unable to retrieve current user college.');
    }
    return usersInSameMajor;
  }

  /**
   * This fetches users from the database that have the same availability
   */

  Future<List<User_Main>> fetchUsersWithSameAvailability() async {
    List<User_Main> usersWithSameAvailability = [];

    if (user != null) {
      usersWithSameAvailability =
          await homeRepository.fetchUsersWithSameAvailability();

      if (usersWithSameAvailability.isNotEmpty) {
      } else {
        print('No users found with the same availability.');
      }
    } else {
      print('Unable to retrieve current user availability.');
    }
    return usersWithSameAvailability;
  }

  void getUsersWithSimilarMajorNames() async {
    String? currentUserMajor = await firestoreService.getCurrentUserMajor();

    if (currentUserMajor != null) {
      List<String> similarMajorUserNames =
          await firestoreService.getUsersWithSameMajorNames(currentUserMajor);

      if (similarMajorUserNames.isNotEmpty) {
      } else {
        print('No users found with a similar major.');
      }
    } else {
      print('Unable to retrieve current user major.');
    }
  }

  void getUser() {
    user = auth.currentUser;
  }

  void setState(Null Function() param0) {}
}
