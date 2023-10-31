import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/src/constants/sizes.dart';
import 'package:studybuddy/src/constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(sDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sOtpTitle,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 80)),
          const SizedBox(
            height: sDefaultSize,
          ),
          Text(
            sOtpSubtitle.toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "$sOtpMessage + sEmail",
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: sDefaultSize,
          ),
          // OtpTextField(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   numberOfFields: 6,
          //   fillColor: Colors.black.withOpacity(0.1),
          //   filled: true,
          //   onSubmit: (code){
          //     print("OTP is => $code");
          //   },
          // ),
          const SizedBox(
            height: sDefaultSize,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text(sNext)),
          )
        ],
      ),
    ));
  }
}
