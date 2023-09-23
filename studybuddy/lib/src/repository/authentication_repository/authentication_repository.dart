import  'package:get/get.dart';
import  'package:get/get_core/src/get_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studybuddy/src/features/authentication/screens/landing_page.dart';
import 'package:studybuddy/src/repository/authentication_repository/sign_up_email_and_password_failure.dart';

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
      Get.offAll(() => WelcomeScreen());
    } else {
      Get.offAll(() => LandingPage());
    }
  }

  //Method to register a new user by creating a new user with email and password
  void registerUser(String email, String password) async {
    print("attempting to register user");
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => LandingPage())
          : Get.offAll(() => WelcomeScreen());
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
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {}
    catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
  // Future

}