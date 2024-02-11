import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../utils/user_preferences.dart';
import '../../models/user.dart' as modelUser;
import '../widgets/appbar-widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/textfield_widget.dart';

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

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late Future<List<String>> collegeNamesList;

  @override
  void initState() {
    super.initState();
    collegeNamesList = retrieveMultipleColleges();
  }

  modelUser.User user =
      UserPreferences.myUser; //this retrieves colleges by their names only

  String itemSelected = '';

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                FutureBuilder(
                    future: collegeNamesList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.center,
                                dropdownSearchDecoration: InputDecoration(
                                    hintText: "Select College",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                              ),
                              onChanged: (value) {
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
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'About',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) {},
                ),
              ],
            ),
          ),
        ),
      );
}
