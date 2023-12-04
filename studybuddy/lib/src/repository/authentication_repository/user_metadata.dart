import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


//Adding data to the user collection
Future<void> addUser(String fullName, String email, String schoolName) async {
  //define the users collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  // Call the user's CollectionReference to add a new user
  users.add({
    'fullName': fullName, // John Doe
    'email': email, // Stokes and Sons
    'schoolName': schoolName, // 42
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
