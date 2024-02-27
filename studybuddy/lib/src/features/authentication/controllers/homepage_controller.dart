import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../repository/users_repository/users_repository.dart';

/**
 * This controller fetches data from the database to be displayed on the home screen
 */
class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();
  FirestoreService firestoreService = FirestoreService();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  List users = []; //list of users that match the current user's defns
  @override
  void onInit() {
    super.onInit();
    print("hello world");
    getUsersWithSimilarMajorNames();
  }

  /**
   * This fetches users from the database that match the set defns of the current user
   * It includes: school, major, and meeting mode
   */
  Future<List> fetchusersThatMatchCurrentUser() async {
    const url2 = '''https://firestore.googleapis.com/v1/projects/
    studybuddyapp-93539/databases/(default)/
        ''';
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url2);

    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    print("The json is: $json");
    users = json['results'];
    setState(() {
      users = json('results');
    });
    print("fetching data is done");

    print("This is the controller users: $users");

    return users;
  }

  void getUsersWithSimilarMajorNames() async {
    String? currentUserMajor = await firestoreService.getCurrentUserMajor();

    if (currentUserMajor != null) {
      List<String> similarMajorUserNames = await firestoreService
          .getUsersWithSameMajorNames(currentUserMajor);

      if (similarMajorUserNames.isNotEmpty) {
        print('Users with similar major: $similarMajorUserNames');
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
