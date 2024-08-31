import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybuddy/src/features/authentication/screens/main_screens/home_screen_main.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/onboarding_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/welcome_screen.dart';
import 'package:studybuddy/src/repository/authentication_repository/exceptions/login_email_and_password_failure.dart';
import 'package:studybuddy/src/repository/authentication_repository/exceptions/sign_up_email_and_password_failure.dart';

import '../../features/authentication/screens/main_screens/main_screen.dart';
import '../../utils/User_Data.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  late final Rx<User?> firebaseUser;

  //Defining firebase variables here
  final _auth = FirebaseAuth.instance;

  late var isLoginValid = true;

  Future<bool> getUserFirstTimeFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? false;
  }

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    //checks the status of the current user
    //binds the stream to the user and listens to the user/what they're doing
    ever(firebaseUser, _setInitialScreen);
    firebaseUser.bindStream(_auth.userChanges());
  } //The Rx puts the user in a stream and this user is a non-private variable

  //Defining methods to be used in the controllers here

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => WelcomeScreen());
    } else {
      UserData userData = UserData();

      // Perform UserData initialization (if any additional async operations needed)
      await userData.initializeUserDetails();
      Get.put(userData);
      bool isFirstTime = await getUserFirstTimeFlag();
      if (isFirstTime) {
        // If it's the user's first time, navigate to the OnBoardingScreen
        Get.offAll(() => const OnBoardingScreen());
      } else {
        // If it's not the user's first time, navigate to the HomeScreenMain
        Get.offAll(() => const HomeScreenMain());
      }
    }
  }

  /// Method to register a new user by creating a new user with email and password
  Future<Map> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // After successful registration, update the user's profile with their full name.
      await userCredential.user!.updateDisplayName(firstName);
      // Save the full name to Firestore.
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'schoolName': '',
        'major': '',
        'classYear': '',
        'about': '',
        // Add other user data as needed.
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isFirstTime', true);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.message!);
      return {'message': ex, 'success': false};
    }
    return {'message': '200 status', 'success': true};
  }

  //Method to login a user with email and password
  Future<bool?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Login successful, navigate to the next screen (e.g., the main screen).
      if (firebaseUser.value != null) {
        // Create an instance of UserData
        UserData userData = UserData();

        // Perform UserData initialization (if any additional async operations needed)
        await userData.initializeUserDetails();
        Get.put(userData);
        Get.offAll(() => const MainScreen());
      } else {
        isLoginValid = false;
      }
      // Get.offAll(WelcomeScreen()); // Replace NextScreen() with the name of your main screen widget.
    } on FirebaseAuthException catch (e) {
      final ex = LoginEmailAndPasswordFailure.code(e.code);
      throw ex;
    } catch (_) {
      final ex = LoginEmailAndPasswordFailure();
      throw ex;
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => WelcomeScreen());
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {}
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      'The account already exists with a different credential')),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      'Error occurred while accessing credentials. Try again.')),
            );
          }
        } catch (e) {
          // handle the error here
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error occurred using Google Sign In. Try again.'),
          ));
        }
      }
    }
    return user;
  }

  //Reset password option
  Future forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (err) {
      throw Exception(err.message.toString());
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return auth.currentUser;
  }
}
