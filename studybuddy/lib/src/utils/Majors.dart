//This file contains the model for defining the majors of a college
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Majors extends GetxController {
  static Majors get instance => Get.find();
  final List<String> majorsList = [
    'Accounting',
    'Agriculture',
    'Anthropology',
    'Architecture',
    'Art',
    'Biology',
    'Business',
    'Chemistry',
    'Communications',
    'Computer Science',
    'Criminal Justice',
    'Dance',
    'Dentistry',
    'Economics',
    'Education',
    'Engineering',
    'English',
    'Environmental Science',
    'Fashion',
    'Film',
    'Finance',
    'Geography',
    'Geology',
    'Graphic Design',
    'Health',
    'History',
    'Hospitality',
    'Human Resources',
    'Information Technology',
    'Journalism',
    'Law',
    'Linguistics',
    'Marketing',
    'Mathematics',
    'Medicine',
    'Music',
    'Nursing',
    'Nutrition',
    'Pharmacy',
    'Philosophy',
    'Photography',
    'Physics',
    'Political Science',
    'Psychology',
    'Public Health',
    'Public Relations',
    'Real Estate',
    'Religious Studies',
    'Social Work',
    'Sociology',
    'Sports',
    'Theater',
    'Veterinary Medicine',
    'Web Design',
    'Women\'s Studies',
  ];

//   save the list of majors in firestore
  void addMajors() {
    FirebaseFirestore.instance.collection('majors').doc().set({
      'collegeMajors': majorsList,
    });
  }
}
