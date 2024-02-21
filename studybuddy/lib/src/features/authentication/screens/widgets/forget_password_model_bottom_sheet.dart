import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forgot_password_screens/forgot_password_email/forget_password_email.dart';
import '../forgot_password_screens/forgot_password_options/forgot_password_button_widget.dart';

/// ForgotPasswordScreen displays popups if the user forgot their login password
class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) => Container(
          padding: const EdgeInsets.all(sDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //it's light blue i dont like
              Text(sForgotPasswordTitle,
                style: Theme.of(context).textTheme.displayLarge,),

              Text(sForgotPasswordSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,),

              const SizedBox(height: sDefaultSize,),
              ForgetPasswordBtnWidget(
                btnIcon: Icons.email_outlined,
                title: sEmail,
                subtitle: sResetViaEmail,
                onTap: (){
                  Navigator.pop(context);
                  Get.to(()=>const ForgetPasswordEmailScreen());
                },
              ),
              const SizedBox(height: sDefaultSize,),
              //To be added later
              // ForgetPasswordBtnWidget(
              //   btnIcon: Icons.mobile_friendly_rounded,
              //   title: sPhone,
              //   subtitle: sResetViaPhone,
              //   onTap: (){},
              // ),
            ],
          )
      ),
    );
  }

}