// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/profile_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/user.dart';
import 'package:studybuddy/src/repository/home_repository/home_repository.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenMain> {
  late Future<List<User_Main>> users;
  final _Pcontroller = Get.put(ProfileController());

  HomeRepository _homeRepo = HomeRepository();
  String college = '';

  @override
  void initState() {
    super.initState();
    users = _homeRepo.fetchUsersAvailability();

    college = _homeRepo.college;
    // update this to a controller
  }

  @override
  Widget build(BuildContext context) {
    void showUserProfile(User_Main user) {
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
                Text('College: ${user.college}'),
                // Text()
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
      drawer:
          // IconButton(
          //   onPressed: () =>
          //   {
          Drawer(
              child: ListView(
        children: [
          FilledButton(
            onPressed: null,
            // TODO update with the actual school name of user
            child: Text("School"),
          ),
          SizedBox(
            height: 24,
          ),
          VerticalDivider(
            thickness: 1,
            indent: 1,
          ),
          FilledButton(
              onPressed: null,
              // TODO update with the actual school name of user
              child: Text("Major")),
          SizedBox(
            height: 24,
          ),
          VerticalDivider(
            thickness: 1,
            indent: 1,
          ),
          OutlinedButton(
            onPressed: () => {},
            child: Text("Time"),
          ),
          Row(
            children: [
              Chip(
                label: Text("In-Person"),
                onDeleted: () => {},
                deleteIcon: Icon(Icons.close),
              ),
              Chip(
                label: Text("Virtual"),
                onDeleted: () => {},
                deleteIcon: Icon(Icons.close),
              ),
              Chip(
                label: Text("Hybrid"),
                onDeleted: () => {},
                deleteIcon: Icon(Icons.close),
                // clipBehavior: ,
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          VerticalDivider(
            thickness: 1,
            indent: 1,
          ),
          ElevatedButton(onPressed: () => {}, child: Text("Apply"))
        ],
      )),
      // icon: Icon(Icons.filter_alt_rounded),),
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
          } else if (snapshot.data!.isEmpty) {
            return Text(
                "Uh oh, looks like we don't have any recommendations for you yet!");
          } else {
            List<User_Main> userList = snapshot.data as List<User_Main>;
            print("the display $userList");
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userList[index].displayName ?? 'no name'),
                  subtitle: Row(children: [
                    Text('College: ${userList[index].college}'),
                    SizedBox(
                      width: 50,
                    ),
                    Text('Major: ${userList[index].major}')
                  ]),
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
