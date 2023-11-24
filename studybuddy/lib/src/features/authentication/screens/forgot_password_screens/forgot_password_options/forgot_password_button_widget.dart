import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });


  final IconData btnIcon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(sDefaultSize),
          decoration: BoxDecoration(
            color: sSecondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(btnIcon, color: sPrimaryColor,),
              const SizedBox(width: sDefaultSize,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      title,
                      style: const TextStyle(
                          color: sPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      )

                  ),
                  Text(
                      subtitle,
                      style: const TextStyle(
                        color: sPrimaryColor,
                        fontSize: 15,
                      )
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}