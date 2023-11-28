import 'package:flutter/cupertino.dart';

// -- Onboarding Screen Text --
const String sOnboardingTitle1 = 'Welcome to Study Buddy';
const String sOnboardingTitle2 = 'Find a Study Buddy';
const String sOnboardingTitle3 = 'Study Together';
const String sOnboardingSubtitle1 =
    'Study Buddy is a platform for students to find other students to study with.';
const String sOnboardingSubtitle2 =
    'Find a study buddy that is studying the same subject as you.';
const String sOnboardingSubtitle3 = 'Study together with your study buddy.';
const String sOnboardingCounter1 = '1/3';
const String sOnboardingCounter2 = '2/3';
const String sOnboardingCounter3 = '3/3';

// -- Profile Screen -- Text
const String uProfile = 'Profile';
const String uEditProfile = 'Edit Profile';
const String uLogOutProfile = 'Logout';
const String uFirstName = 'Nutshell'; //change this later
const String uLastName = 'Benji'; //change this later
const String uProfileName = "$uFirstName $uLastName";
const String uProfileEmail = 'studybuddy@gmail.com'; //change this later
const String uProfileHeading = "$uFirstName's Note";
const String uProfileDescription = uAboutMeContent;
const String uAboutMeContent =
    " I am currently a Junior at UPENN studying Computer Science. I love listening to AfroBeats and hiking. Lets study together!!";

// -- Menu
// const String tMenu5 = tLogout;
const String tMenu1 = "Settings";
const String tMenu2 = "Information";

// -- Update Profile Screen -- Text
const String tDelete = "Delete";
const String tJoined = "Joined";
const String tJoinedAt = " 24 July 2003";

//This is for subject tags
// -- Profile Screen -- ListView
ListView SubjectsOfInterest = ListView(
  children: const [
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
  children: const [
    TableRow(
      children: [
        Text(uProfileName),
        Text(uProfileEmail),
        Text(uProfileDescription),
      ],
    ),
  ],
);
