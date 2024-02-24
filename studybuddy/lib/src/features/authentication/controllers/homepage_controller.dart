import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/**
 * This controller fetches data from the database to be displayed on the home screen
 */
class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  List users = []; //list of users that match the current user's defns
  @override
  void onInit() {
    super.onInit();
    print("hello world");
    fetchusersThatMatchCurrentUser();
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

  void setState(Null Function() param0) {}
}
