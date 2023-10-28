import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forgot_password_screens/forgot_password_email/forget_password_email.dart';
import '../forgot_password_screens/forgot_password_options/forgot_password_button_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) => Container(
          padding: EdgeInsets.all(sDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //it's light blue i dont lioke
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
                  Get.to(()=>ForgetPasswordEmailScreen());
                },
              ),
              SizedBox(height: sDefaultSize,),
              ForgetPasswordBtnWidget(
                btnIcon: Icons.mobile_friendly_rounded,
                title: sPhone,
                subtitle: sResetViaPhone,
                onTap: (){},
              ),
            ],
          )
      ),
    );
  }

}