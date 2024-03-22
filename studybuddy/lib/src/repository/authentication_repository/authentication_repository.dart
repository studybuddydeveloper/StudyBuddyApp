import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/onboarding_screen.dart';
import 'package:studybuddy/src/features/authentication/screens/splash_screens/splash_screeten.dart';
import 'package:studybuddy/src/repository/authentication_repository/exceptions/login_email_and_password_failure.dart';
import 'package:studybuddy/src/repository/authentication_repository/exceptions/sign_up_email_and_password_failure.dart';

import '../../features/authentication/screens/main_screens/main_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  late final Rx<User?> firebaseUser;

  //Defining firebase variables here
  final _auth = FirebaseAuth.instance;

  late var isLoginValid = true;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    //checks the status of the current user
    //binds the stream to the user and listens to the user/what they're doing
    ever(firebaseUser, _setInitialScreen);
    firebaseUser.bindStream(_auth.userChanges());
  } //The Rx puts the user in a stream and this user is a non-private variable

  //so we can reference it anywhere in the app

  //Defining methods to be used in the controllers here

  _setInitialScreen(User? user) {
    print("hello world");
    //if user has been logged out and is null, go to welcome screen
    if (user == null) {
      Get.offAll(() => SplashScreen());
    } else {
      Get.offAll(() => const MainScreen());
    }
  }

  /// Method to register a new user by creating a new user with email and password
  void registerUser(
    String email,
    String schoolName,
    String fullName,
    String password,
    String confirmPassword,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // After successful registration, update the user's profile with their full name.
      await userCredential.user!.updateDisplayName(fullName);
      // Save the full name to Firestore.
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'fullName': fullName,
        'email': email,
        'schoolName': '',
        'major': '',
        'classYear': '',
        'about': '',
        // Add other user data as needed.
      });
      //This checks if the user is null, if not, go to the landing page
      Get.offAll(() => const OnBoardingScreen());
      print("attempting to register user");
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION: ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION: ${ex.message}');
      throw ex; //throwing the exception to the controller
    }
  }

  //Method to login a user with email and password
  Future<bool?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Login successful, navigate to the next screen (e.g., the main screen).
      if (firebaseUser.value != null) {
        Get.offAll(() => const MainScreen());
      } else {
        isLoginValid = false;
      }
      // Get.offAll(WelcomeScreen()); // Replace NextScreen() with the name of your main screen widget.
    } on FirebaseAuthException catch (e) {
      final ex = LoginEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = LoginEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION: ${ex.message}');
      throw ex;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
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
