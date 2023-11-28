import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:studybuddy/src/repository/authentication_repository/sign_up_email_and_password_failure.dart';

import '../../features/authentication/screens/landing_page.dart';
import '../../features/authentication/screens/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Defining firebase variables here
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    //checks the status of the current user
    firebaseUser = Rx(_auth.currentUser);
    //binds the stream to the user and listens to the user/what they're doing
    ever(firebaseUser, _setInitialScreen);
    firebaseUser.bindStream(_auth.userChanges());
  } //The Rx puts the user in a stream and this user is a non-private variable

  //so we can reference it anywhere in the app
  late final Rx<User?> firebaseUser;

  //Defining methods to be used in the controllers here

  _setInitialScreen(User? user) {
    //if user has been logged out and is null, go to welcome screen
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.offAll(() =>
          const ProfileScreen()); //change this to profilescreen so i can see it
    }
  }

  //Method to register a new user by creating a new user with email and password
  void registerUser(String email, String password, String fullName) async {
    print("attempting to register user");

    //  try {
    //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: email,
    //       password: password,
    //     );
    // // After successful registration, update the user's profile with their full name.
    //     await userCredential.user.updateProfile(displayName: fullName);
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
        // Add other user data as needed.
      });
      // User? user = userCredential.user;
      // if (user != null){
      // }
      // //User? user = userCredential.user;
      // //     if (user != null) {
      // //       // Update the user's profile with their full name.
      // //       await user.updateProfile(displayName: fullName);
      // //
      // //       // Save the full name to Firestore.
      // //       await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      // //         'fullName': fullName,
      // //         // Add other user data as needed.
      // //       });

      firebaseUser.value != null
          ? Get.offAll(() => const LandingPage())
          : Get.offAll(() =>
              const ProfileScreen()); //change this to profilescreen so i can see it
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
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
// Future
}
