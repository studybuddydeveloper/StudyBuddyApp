import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title:  Text(
          uProfile, style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun:
    LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(child: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            SizedBox(
              width: 120, height: 120,
            ),
            Text("This is the profile screen")
          ],
        ),
      )),
    );
  }
}
