import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/homepage_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());

  // List<dynamic> users = HomeScreenController
  //     .instance.users; //list of users that match the current user's defns

  @override
  void initState() {
    // Call the initializeUsers method before the widget is built
    super.initState();
    initializeData();
  }

//list of users that match the current user's defns

  Future<void> initializeData() async {
    await controller.fetchusersThatMatchCurrentUser();
    // Once the data is loaded, trigger a rebuild by calling setState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(HomeScreenController.instance.users);
    // print("The users in the homescreen: $users");
    // return AppBar();
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          //todo look for a way to make the users a varuable instead of having
          // this full logic in the build method.
          final user = HomeScreenController.instance.users[index];
          return ListTile(
            title: Text(user['name']['first']),
            subtitle: Text(user['email']),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['picture']['thumbnail']),
            ),
          );
        },
      ),
    );
  }
}
