import  'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studybuddy/src/features/authentication/screens/onboarding_screens/onboarding_screen.dart';
import 'package:studybuddy/src/repository/authentication_repository/exceptions/login_email_and_password_failure.dart';
import 'package:studybuddy/src/repository/authentication_repository/exceptions/sign_up_email_and_password_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/authentication/screens/main_screens/main_screen.dart';
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Defining firebase variables here
  final _auth = FirebaseAuth.instance;

  late var isLoginValid = true;

  @override
  void onReady() {
    //checks the status of the current user
    firebaseUser = Rx(_auth.currentUser);
    //binds the stream to the user and listens to the user/what they're doing
    // ever(firebaseUser, _setInitialScreen);
    firebaseUser.bindStream(_auth.userChanges());
  } //The Rx puts the user in a stream and this user is a non-private variable
  //so we can reference it anywhere in the app
  late final Rx<User?> firebaseUser;
  //Defining methods to be used in the controllers here

  // _setInitialScreen(User? user) {
  //   //if user has been logged out and is null, go to welcome screen
  //   if (user == null) {
  //     Get.offAll(() => const WelcomeScreen());
  //   } else {
  //     Get.offAll(() => const MainScreen());
  //   }
  // }

  /// Method to register a new user by creating a new user with email and password
  void registerUser(String email, String schoolName, String fullName,
                    String password, String confirmPassword, ) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

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
      //This checks if the user is null, if not, go to the landing page
      Get.offAll(() => const OnBoardingScreen());
      print("attempting to register user");
    }  on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION: ${ex.message}');
      throw ex;
    } catch(_) {
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
    }
    catch (_) {
      final ex = LoginEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION: ${ex.message}');
      throw ex;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();




}