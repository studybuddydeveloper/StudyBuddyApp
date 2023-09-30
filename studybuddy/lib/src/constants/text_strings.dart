import 'package:flutter/cupertino.dart';

// -- Onboarding Screen Text --
const String sOnboardingTitle1 = 'Welcome to Study Buddy';
const String sOnboardingTitle2 = 'Find a Study Buddy';
const String sOnboardingTitle3 = 'Study Together';
const String sOnboardingSubtitle1 =
    'Study Buddy is a platform for students to find other students to study with.';
const String sOnboardingSubtitle2 =
    'Find a study buddy that is studying the same subject as you.';
const String sOnboardingSubtitle3 =
    'Study together with your study buddy.';
const String sOnboardingCounter1 = '1/3';
const String sOnboardingCounter2 = '2/3';
const String sOnboardingCounter3 = '3/3';

// -- Profile Screen -- Text
const String uProfile = 'Profile';
const String uEditProfile = 'Edit Profile';
const String uLogOutProfile = 'Log Out';
const String uProfileName = 'Username';
const String uProfileEmail = 'Email';
const String uProfileDescription = 'Description';

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
        Text(uProfileName),
        Text(uProfileEmail),
        Text(uProfileDescription),
      ],
    ),
  ],
);