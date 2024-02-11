import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());

    final color = Theme.of(context).colorScheme.primary;

    //instantiate the controller here at this point
    // ProfileController.instance.addProfileInfo();
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );
  }

  //declaring a clickable icon for the edit icon button
  Widget buildEditIcon(Color color) {
    return buildCircle(
      all: 4,
      color: color,
      child: IconButton(
        onPressed: onClicked,
        icon: Icon(
          isEdit ? Icons.add_a_photo : Icons.edit,
          color: Colors.white,
        ),
      ),
    );
    //   color: Colors.white;
    // all: 21,
    // child: IconButton(
    //   onPressed: onClicked,
    //   icon: buildCircle(
    //     color: color,
    //     all: 0,
    //     child: Icon(
    //     isEdit ? Icons.add_a_photo : Icons.edit,
    //     color: Colors.white,
    // )
    //    )
    // )
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
