import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxController {
  static FirestoreService get instance => Get.find();

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<String?> getCurrentUserCollege() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc =
            await usersCollection.doc(currentUser.uid).get();
        print("The current user school: ${userDoc['schoolName'] as String?}");
        return userDoc['schoolName'] as String?;
      } catch (e) {
        print('Error getting user major: $e');
        return null;
      }
    }
    return null;
  }

  Future<String?> getCurrentUserMajor() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc =
            await usersCollection.doc(currentUser.uid).get();
        return userDoc['major'] as String?;
      } catch (e) {
        print('Error getting user major: $e');
        return null;
      }
    }
    return null;
  }

  Future<List<String>> getUsersWithSameMajorNames(String major) async {
    try {
      QuerySnapshot querySnapshot =
          await usersCollection.where('major', isEqualTo: major).get();
      return querySnapshot.docs.map((doc) => doc['name'] as String).toList();
    } catch (e) {
      print('Error querying Firestore for users with the same major: $e');
      return [];
    }
  }
}
