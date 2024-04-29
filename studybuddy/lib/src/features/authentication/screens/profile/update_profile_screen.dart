import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/controllers/profile_controller.dart';
import 'package:studybuddy/src/features/authentication/screens/availability_schedule_screen/AvailabilityTimeWidget.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';

import '../../../../utils/Majors.dart';
import '../../../../utils/user_preferences.dart';
import '../../models/user.dart' as modelUser;
import '../welcome_screen.dart';
import '../widgets/appbar-widget.dart';
import '../widgets/profile_widget.dart';

Future<List<String>> retrieveMultipleColleges() async {
  final CollectionReference _collegeCollection =
      FirebaseFirestore.instance.collection('colleges');
  QuerySnapshot collegeNames = await _collegeCollection.get();
  List<String> collegeNamesList = [];
  for (QueryDocumentSnapshot doc in collegeNames.docs) {
    String name = doc['college_name'].toString();
    collegeNamesList.add(name);
  }
  return collegeNamesList;
}

Future<List<String>> retrieveMultipleMajors() async {
  final CollectionReference _majorCollection =
      FirebaseFirestore.instance.collection('majors');
  QuerySnapshot majorNames = await _majorCollection.get();
  List<String> majorNamesList = [];
  for (QueryDocumentSnapshot doc in majorNames.docs) {
    String name = doc['name'].toString();
    majorNamesList.add(name);
  }
  return majorNamesList;
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  ProfileScreen profile = ProfileScreen();
  FirebaseAuth auth = FirebaseAuth.instance;

  late Future<List<String>> collegeNamesList;
  late Future<List<String>> majorNamesList;
  bool nameFieldFocused = false;

  @override
  void initState() {
    super.initState();
    collegeNamesList = retrieveMultipleColleges();
    majorNamesList = retrieveMultipleMajors();
  }

  modelUser.User user =
      UserPreferences.myUser; //this retrieves colleges by their names only

  // modelUser.User user = UserPreferences.UpdateUser;

  String itemSelected = '';
  String majorSelected = '';
  final controller = Get.put(ProfileController());
  final m_controller = Get.put(Majors());

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
            appBar: buildAppBar(context, title: Text('Profile'),
                leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ), actions: [
              PopupMenuButton(
                color: Colors.white,
                // backgroundColor: Colors.white,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          // Logout icon
                          SizedBox(width: 10),
                          Text('Logout', style: TextStyle(color: Colors.red)),
                          // Set text color to red for logout
                        ],
                      ),
                      value: 'logout',
                    ),
                  ];
                },
                onSelected: (value) {
                  switch (value) {
                    case 'logout':
                      // Handle logout action
                      Get.offAll(() => WelcomeScreen());
                      break;
                  }
                },
              ),
            ]),
            floatingActionButton: FloatingActionButton(
                //TODO Add the functionality to save the user's profile information
                // to the database of the assigned user
                onPressed: () {
                  controller.saveProfileInfo(
                    controller.fullName.text,
                    controller.email.text,
                    controller.college.text,
                    controller.about.text,
                    controller.major.text,
                    controller.classYear.text,
                  );
                },
                child: Text('Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ))),
            body: FutureBuilder(
              future: collegeNamesList,
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                if (snapshot.hasData) {
                  return ListView(
                    // padding: const EdgeInsets.symmetric(horizontal: 32),
                    // physics: const BouncingScrollPhysics(),
                    children: [
                      ProfileWidget(
                        imagePath: user.imagePath,
                        isEdit: true,
                        onClicked: () async {},
                      ),
                      const SizedBox(height: 24),
                      Text('Name'),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: controller.fullName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: nameFieldFocused
                                ? ''
                                : controller.fullName.text,
                          ),
                          onChanged: (value) {
                            // Handle changes to the 'Name' section
                          },
                          maxLines: null,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text('Email'),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          enabled: false,
                          // controller: controller.email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: controller.email.text,
                          ),
                          onChanged: (value) {
                            // Handle changes to the 'Name' section
                          },
                          maxLines: null,
                        ),
                      ),
                      const SizedBox(height: 24),
                      FutureBuilder(
                          future: collegeNamesList,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<String> collegeNames = snapshot.data!;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'College',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  DropdownSearch<String>(
                                    items: collegeNames,
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                    ),
                                    dropdownButtonProps: DropdownButtonProps(
                                      color: Colors.blue,
                                    ),
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      dropdownSearchDecoration: InputDecoration(
                                          hintText: "Select College",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                    ),
                                    onChanged: (value) {
                                      controller.college.text =
                                          value.toString();
                                      setState(() {
                                        itemSelected = value.toString();
                                      });
                                    },
                                    selectedItem: itemSelected,
                                  ),
                                ],
                              );
                            }
                          }),
                      FutureBuilder(
                          future: majorNamesList,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<String> majorNames = snapshot.data!;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Majors',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  DropdownSearch<String>(
                                    items: majorNames,
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                    ),
                                    dropdownButtonProps: DropdownButtonProps(
                                      color: Colors.blue,
                                    ),
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      dropdownSearchDecoration: InputDecoration(
                                          hintText: "Select Major",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                    ),
                                    onChanged: (value) {
                                      controller.major.text = value.toString();
                                      setState(() {
                                        majorSelected = value.toString();
                                      });
                                    },
                                    selectedItem: majorSelected,
                                  ),
                                ],
                              );
                            }
                          }),
                      const SizedBox(height: 24),
                      Text('About Section'),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: controller.about,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: nameFieldFocused ? '' : 'About',
                          ),
                          onChanged: (value) {
                            // Handle changes to the 'Name' section
                          },
                          maxLines: null,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Column(children: [
                        TextField(
                          controller: controller.classYear,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Class Year',
                          ),
                        ),
                        // Todo make the class year a dropdown instead of entered text
                        // GraduatingYearDropdown(),
                      ])
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                // }
                // else {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                return Text('data');
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  tooltip: 'Home',
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Availability',
                  icon: IconButton(
                      icon: Icon(Icons.event_available),
                      onPressed: () {
                        Get.to(() => ScheduleGridWidget());
                      }),
                  label: 'Availability',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                  tooltip: 'Coming Soon!',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Profile',
                  icon: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Get.to(() => ProfileScreen());
                    },
                  ),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              // currentIndex: _selectedIndex,
              // onTap: _onItemTapped,
            )),
      );
}
