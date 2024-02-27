import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String name;
  final String email;
  final String college;
  final String about;
  final String major;

  const UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.college,
    required this.about,
    required this.major,
  });

  toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "college": college,
      "about": about,
      "major": major,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      uid: document.id,
      name: data?["name"],
      email: data?["email"] ?? '',
      college: data?["college"] ?? '',
      about: data?["about"] ?? '',
      major: data?["major"] ?? '',
    );
  }
}
