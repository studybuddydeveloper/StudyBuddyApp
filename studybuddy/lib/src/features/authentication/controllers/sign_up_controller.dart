import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/authentication_repository.dart';

/**
 * GetX is a state management and navigation library for Flutter that aims to
    simplify and enhance the development of Flutter applications.
    It provides a range of features, including state management,
    dependency injection, reactive programming, and simplified navigation,
    making it easier for developers to build efficient and maintainable
    Flutter apps with less boilerplate code. It's known for its simplicity and performance.
 */

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Textfiled Controllers to retrieve landing details from user
  final email = TextEditingController();
  final fullName = TextEditingController();
  final schoolName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  //Register user method to be called in the WelcomeScreen
  void registerUser(String email, String fullName, String schoolName,
      String password, String confirmPassword) {
    // Dependency
    final AuthenticationRepository authRepo =
        Get.put(AuthenticationRepository());
    //perform authentication here for a new user
    authRepo.registerUser(
      email,
      schoolName,
      fullName,
      password,
      confirmPassword,
    );
  }
}
