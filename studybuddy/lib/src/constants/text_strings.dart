import 'package:flutter/cupertino.dart';

// -- Generic Text --
const String sLoginText = 'Login';
const String sSignupText = 'SignUp';
const String sEmail = 'Email';
const String sPhone = 'Phone';
const String sNext = 'Next';
const String sEmailHint = 'Enter your email';
const String sPassword = 'Password';
const String sConfirmPassword = 'Confirm Password';
const String sSchoolName = 'School Name';
const String sForgotPassword = 'Forgot Password?';
const String sOr = 'Or';
const String sLoginWithGoogle = 'Sign-in with Google';
const String sDontHaveAnAccount = 'Don\'t have an account? ';
const String sAlreadyHaveAnAccount = 'Already have an account? ';
const String sOhSnap = "Unable to send verification email";
const String sConfirmEmail = "Confirm your email";
const String sContinueButton = "Continue";
const String sResendEmail = "Resend Email";

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

// -- Welcome Screen -- Text
const String sWelcomeTitle = 'Welcome to Study Buddy';
const String sWelcomeSubtitle = 'Find a study buddy today!';


// -- Login Screen -- Text
const String sLoginTitle = 'Login';
const String sLoginSubtitle = 'Welcome back! Login to your account';

// -- SignUp Screen -- Text
const String sSignUpTitle = 'Sign Up';
const String sSignUpSubtitle = 'Create an account to get started';
const String sFullName = 'Full Name';

// -- Forgot Password Screen -- Text
const String sForgotPasswordTitle = 'Forgot Password';
const String sForgotPasswordSubtitle =
    'Enter your email and we will send you a link to reset your password';
const String sResetViaEmail = 'Reset via Email';
const String sResetViaPhone = 'Reset via Phone';

// -- Forgot Password via Phone Screen -- Text
const String sForgotPasswordViaPhoneTitle = 'Enter your phone number to receive OTP';

// -- Forgot Password via Email Screen -- Text
const String sForgotPasswordViaEmailTitle = 'Enter your email to receive OTP';

// -- OTP Screen -- Text
const String sOtpTitle = 'Enter OTP';
const String sOtpSubtitle = 'Verification';
const String sOtpMessage = 'Enter the OTP sent to your email';
const String sResendOtp = 'Resend OTP';
