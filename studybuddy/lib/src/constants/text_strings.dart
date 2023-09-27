// -- Profile Screen -- Text

import 'package:flutter/cupertino.dart';

const String Profile = 'Profile';
const String EditProfile = 'Edit Profile';
const String LogOutProfile = 'Log Out';
const String ProfileUserName = 'Username';
const String ProfileEmail = 'Email';
const String ProfileDescription = 'Description';

//This is for subject tags
// -- Profile Screen -- ListView
ListView SubjectsOfInterest = ListView(
  children: [
    Text('Subjects of Interest'),
    Text('Subject 1'),
    Text('Subject 2'),
    Text('Subject 3'),
    Text('Subject 4'),
    Text('Subject 5'),
    Text('Subject 6'),
    Text('Subject 7'),
    Text('Subject 8'),
    Text('Subject 9'),
    Text('Subject 10'),
  ],
);

// -- Profile Screen -- Table
//Might be taking out this is for the user time availability
Table ProfileTable = Table(
  children: [
    TableRow(
      children: [
        Text(ProfileUserName),
        Text(ProfileEmail),
        Text(ProfileDescription),
      ],
    ),
  ],
);