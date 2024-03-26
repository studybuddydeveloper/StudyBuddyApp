// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/user.dart';

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

  // final _Pcontroller = Get.put(ProfileController());

  // HomeRepository _homeRepo = HomeRepository();
  String college = '';

  @override
  void initState() {
    super.initState();
    // users = _homeRepo.fetchUsersAvailability();

    // college = _homeRepo.college;
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
                  FilledButton(
                    onPressed: null,
                    // TODO update with the actual school name of user
                    child: Text(
                      "School",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(100, 50)),
                    ),
                  ),
                  FilledButton(
                    onPressed: () => {},
                    // TODO update with the actual school name of user
                    child: Text(
                      "Major",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      fixedSize: MaterialStateProperty.all(Size(100, 50)),
                    ),
                  ),
                  CheckboxListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // hoverColor: Colors.black,
                    // activeColor: Colors.black,
                    // backgroundColor: Colors.black,
                    title: Text(
                      'Time',
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
                            fillColor: MaterialStateProperty.all(Colors.yellow),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: BorderSide(color: Colors.black),
                            tileColor: Colors.white,
                            title: Text(
                              'In Person',
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
                            selectedTileColor: Colors.yellow,
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
                            fillColor: MaterialStateProperty.all(Colors.yellow),

                            tileColor: Colors.white,
                            title: Text(
                              'Virtual',
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
                            selectedTileColor: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          child: CheckboxListTile(
                            fillColor: MaterialStateProperty.all(Colors.yellow),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: BorderSide(color: Colors.black),
                            tileColor: Colors.white,
                            title: Text(
                              'Hybrid',
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
                            selectedTileColor: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => {},
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
        ),
        body: Text('College: $college')

        // FutureBuilder(
        //   future: users,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return CircularProgressIndicator();
        //     } else if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     } else if (snapshot.data!.isEmpty) {
        //       return Text(
        //           "Uh oh, looks like we don't have any recommendations for you yet!");
        //     } else {
        //       List<User_Main> userList = snapshot.data as List<User_Main>;
        //       print("the display $userList");
        //       return ListView.builder(
        //         itemCount: userList.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             title: Text(userList[index].displayName ?? 'no name'),
        //             subtitle: Row(children: [
        //               Text('College: ${userList[index].college}'),
        //               SizedBox(
        //                 width: 50,
        //               ),
        //               Text('Major: ${userList[index].major}')
        //             ]),
        //             onTap: () => showUserProfile(userList[index]),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
        );
  }
}
