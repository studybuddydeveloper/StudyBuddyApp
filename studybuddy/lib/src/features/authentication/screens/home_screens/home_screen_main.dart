// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/profile_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/user.dart';
import 'package:studybuddy/src/repository/home_repository/home_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> users;
  final _Pcontroller = Get.put(ProfileController());

  HomeRepository _homeRepo = HomeRepository();
  String college = '';

  @override
  void initState() {
    super.initState();
    print("about t enter");
    users = _homeRepo.fetchUserProfile();

    college = _homeRepo.college;
    print("The college $college");
    // update this to a controller
  }

  @override
  Widget build(BuildContext context) {
    void showUserProfile(User user) {
      print("The display $user.displayName");

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text('Name: ${user.displayName}'),
                Text('College: ${college}'),
                // Add other user details as needed
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement any action you want when the button is pressed
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('College Buddies'),
      ),
      body: FutureBuilder(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<User> userList = snapshot.data as List<User>;
            print("the display $userList");
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userList[index].displayName ?? 'no name'),
                  subtitle: Text('College: $college'),
                  onTap: () => showUserProfile(userList[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
