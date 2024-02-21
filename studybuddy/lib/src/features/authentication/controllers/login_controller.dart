import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController{

    static LoginController get instance => Get.find();
    //Textfiled Controllers to retrieve landing details from user
    final email = TextEditingController();
    final password = TextEditingController();
    //Login user method to be called in the WelcomeScreen
    bool loginUser(String email, String password) {
      //perform authentication here for a new user
        final bool isLoginValid = AuthenticationRepository.instance.loginWithEmailAndPassword(email,
          password) as bool;
        return isLoginValid;
    }
}