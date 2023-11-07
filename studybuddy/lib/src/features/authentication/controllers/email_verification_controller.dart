
import 'package:get/get.dart';
import 'package:studybuddy/src/repository/authentication_repository/authentication_repository.dart';

/**
 * Responsible for enablign email verification
 */
class MailVerificationController extends GetxController {

  // @override
  // void onInit() {
  //   super.onInit();
  //   sendVerificationEmail();
  // }

  ///--- Send or resend verification email
  // void sendVerificationEmail() async {
  //   try {
  //     await AuthenticationRepository.instance.sendEmailVerification();
  //   } catch (e) {
  //     Helper.errorSnackbar(title: sOhSnap, message: e.toString());
  //   }
  // }

  ///--- Set timer to check if verification completed then redirect
  void setTimerForAutoRedirect() {}

  ///--- Manually check if verification completed then redirect
  void manuallyCheckEmailVerificationStatus() {}
}