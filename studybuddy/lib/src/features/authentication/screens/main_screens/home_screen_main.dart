// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/src/features/authentication/controllers/homepage_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/user.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';

import '../../../../repository/home_repository/home_repository.dart';
import '../../../../utils/User_Data.dart';
import '../../controllers/profile_controller.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenMain> {
  late Future<List<User_Main>> users;

  bool isTimeChecked =
      false; // Define a boolean variable to track the state of the checkbox
  bool isInpersonChecked = false;
  bool isHybridChecked = false;
  bool isVirtualChecked = false;
  bool isSchoolChecked = true;
  bool isMajorChecked = false;

  final _Pcontroller = Get.put(ProfileController());
  late final HomeScreenController _hController;

  late HomeRepository _homeRepo;
  String college = '';

  @override
  void initState() {
    super.initState();
    _hController = HomeScreenController(
        userData: Provider.of<UserData>(context, listen: false));
    users = _hController.fetchUsersInSameCollege();
  }

  @override
  Widget build(BuildContext context) {
    // Assuming you have a widget tree where you create an instance of AuthProvider

    void showUserProfile(User_Main user) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${user.displayName + '\'s'} Profile',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Card(
                          elevation: 2.0,
                          // Add elevation for a shadow effect
                          margin: EdgeInsets.all(10.0),
                          // Add margin for spacing
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Name: ${user.displayName}')),
                        ),
                        SizedBox(height: 10.0),
                        Card(
                            elevation: 2.0,
                            // Add elevation for a shadow effect
                            margin: EdgeInsets.all(10.0),
                            // Add margin for spacing
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('College: ${user.college}'),
                            )),
                        SizedBox(height: 10.0),
                        Card(
                            elevation: 2.0,
                            // Add elevation for a shadow effect
                            margin: EdgeInsets.all(10.0),
                            // Add margin for spacing
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Name: ${user.major}'),
                            ))
                      ]),
                    ),

                    // Text()
                    // Add other user details as needed
                    SizedBox(height: 20.0),
                    SizedBox(
                      height: 20.0,
                      child: Text('About Me: ${user.about}'),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),

                        minimumSize: Size(200, 50), // Set minimum width
                        // Adjust padding
                      ),
                      onPressed: () {
                        // Implement any action you want when the button is pressed
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ));
        },
      );
    }

    return Scaffold(
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                  ],
                ),
                Text(
                  'Filter by:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //TODO Include vertical line
                const Divider(
                  thickness: 1,
                  indent: 1,
                  color: Colors.black,
                ),
                CheckboxListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.black),
                  tileColor: Colors.white,
                  title: Text(
                    'SCHOOL',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: isSchoolChecked,
                  // Set the initial value of the checkbox
                  onChanged: null,
                ),

                CheckboxListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: Text(
                    'MAJOR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: isMajorChecked,
                  // Set the initial value of the checkbox
                  onChanged: (newValue) {
                    // Handle checkbox state change
                    setState(() {
                      isMajorChecked = newValue!;
                    });
                  },
                  selectedTileColor: Colors.black,
                ),
                CheckboxListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: Text(
                    'TIME',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: isTimeChecked,
                  // Set the initial value of the checkbox
                  onChanged: (newValue) {
                    // Handle checkbox state change
                    setState(() {
                      isTimeChecked = newValue!;
                    });
                  },
                  selectedTileColor: Colors.black,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: BorderSide(color: Colors.black),
                          tileColor: Colors.white,
                          title: Text(
                            'IN PERSON',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: isInpersonChecked,
                          // Set the initial value of the checkbox
                          onChanged: (newValue) {
                            // Handle checkbox state change
                            setState(() {
                              isInpersonChecked = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: BorderSide(color: Colors.black),

                          tileColor: Colors.white,
                          title: Text(
                            'VIRTUAL',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: isVirtualChecked,
                          // Set the initial value of the checkbox
                          onChanged: (newValue) {
                            // Handle checkbox state change
                            setState(() {
                              isVirtualChecked = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: BorderSide(color: Colors.black),
                          tileColor: Colors.white,
                          title: Text(
                            'HYBRID',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: isHybridChecked,
                          // Set the initial value of the checkbox
                          onChanged: (newValue) {
                            // Handle checkbox state change
                            setState(() {
                              isHybridChecked = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () => {
                          if (isMajorChecked)
                            {
                              users = _hController.fetchUsersInSameMajor(),
                            }

                          // take away the else
                          else if (isTimeChecked)
                            {
                              // users get intersected with the users
                              // that have the same availability
                              users =
                                  _hController.fetchUsersWithSameAvailability(),
                            },
                          Navigator.pop(context),
                        },
                    child: Text("Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )))
              ],
            ),
          )),
      // icon: Icon(Icons.filter_alt_rounded),),
      appBar: AppBar(
        title: const Text('College Buddies'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
          ),
        ],
      ),
      body:
          // Text('College: $college'),
          FutureBuilder(
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
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.black,
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
