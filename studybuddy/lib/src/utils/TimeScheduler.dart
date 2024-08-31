import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:studybuddy/src/utils/UserAvailabilityModel.dart';

/**
 * This class serves as the backend for the time scheduling of the user.
 */
class TimeScheduler extends GetxController {
  static TimeScheduler get instance => Get.find();
  final String uid;

  //
  // var timeSchedule;
  //
  // // this creates an object representation of the user's time schedule for a specific day
  TimeScheduler({required this.uid}) {}

  /**
   * this saves the user's time schedule to the database in the time-schedule collection
   */
  Future<void> saveToDatabase(String day, String start, String end) async {
    // save to database

    try {
      CollectionReference timeScheduleCollection =
          FirebaseFirestore.instance.collection('time-schedule');

      // Right now, we only let users select one timeslot per day

      // TODO: Eventually, what we would want to do Is have them select multiple timeslots per day
      // by setting startTimeOfDay and endTimeOfDay to be lists of strings

      // Reference to to the users document

      DocumentReference userDocRef = timeScheduleCollection.doc(uid);

      // Reference to the appointment subcollection within the user's document
      CollectionReference appointmentsCollection =
          userDocRef.collection('appointments');

      await appointmentsCollection.add({
        'dayOfWeek': day,
        'startTimeOfDay': start,
        'endTimeOfDay': end,
      });
    } catch (e) {
      print("Error saving data to the database");
    }
  }

  Future<List<UserAvailabilityModel>> getUserAppointments() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('time-schedule')
        .doc(uid)
        .collection('appointments')
        .get();

    // print("The querysnapshot: ${querySnapshot.docs.length}");
    return querySnapshot.docs.map((doc) {
      // print("yes her");
      return UserAvailabilityModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  //
  // void getInfoStream() {
  //   FirebaseFirestore.instance.collection('your_collection').snapshots().listen((snapshot) {
  //     var data = snapshot.docs.map((doc) => UserAvailabilityModel.fromSnapshot(doc)).toList();
  //     // Update your data
  //     // For example, if you're using GetX's reactive state management
  //     // you can update the observable list
  //     yourList.value = data;
  //   });
  // }
  /**
   * This returns the time schedule of a specific user
   */

  static Future<Map<String, List<String>>> getTimeScheduleOfUser(
      String userId) async {
    Map<String, List<String>> timeSchedule = {};
    CollectionReference timeScheduleCollection =
        FirebaseFirestore.instance.collection('time-schedule');

    // Query documents where the userId field matches the specified userId,
    // and It is an object containing docs, size, isempty and isNotEmpty
    QuerySnapshot querySnapshot =
        await timeScheduleCollection.where('userId', isEqualTo: userId).get();
    if (querySnapshot.isBlank!) {
      print("Error, there is no availability for this user");
    } else {
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        timeSchedule[documentSnapshot.get('dayOfWeek')] = [
          documentSnapshot.get('startTimeOfDay') +
              '-' +
              documentSnapshot.get('endTimeOfDay')
        ];
      }
    }
    return timeSchedule;
  }

  /**
   * This returns a basic list of all registered users with the same time schedule as userA
   *  TODO: I don't like the fact that this method is calling another method
   *  It leads to a lot of unnecessary calls to the database and overcoupling
   */
  static Future<List<String>> getMatchingTimeSchedules(String uid) async {
    List<String> listOfMatchingUsers = [];

    Map<String, List<String>> timeSchedule = await getTimeScheduleOfUser(uid);
    CollectionReference timeScheduleCollection =
        FirebaseFirestore.instance.collection('time-schedule');

    // timeSchedule looks like:
    // { 'Monday': ['3:00pm' - '5:00pm'], 'Tuesday': ['3:00pm' - '5:00pm']}
    //Query the database for users with the same time schedule
    for (var start = 0; start < timeSchedule.length; start++) {
      // break the time schedule into its components
      // element at start is a list of times for a specific day
      String day = timeSchedule.keys.elementAt(start);
      // start time is before the split
      List<String> Times = day[0].split('-');
      String startTime = Times[0];
      // end time is after the split
      String endTime = Times[1];

      // Query the database for users with the same time schedule
      await timeScheduleCollection
          .where('dayOfWeek',
              isEqualTo: day) // Assuming 'dayOfWeek' is the field in Firestore
          .where('startTimeOfDay',
              isEqualTo:
                  startTime) // Assuming 'startTimeOfDay' is the field in Firestore
          .where('endTimeOfDay',
              isEqualTo:
                  endTime) // Assuming 'endTimeOfDay' is the field in Firestore
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          listOfMatchingUsers.add(doc.id);
        });
      });
    }

    return listOfMatchingUsers;
  }

// TODO: Implement a method that calls one of the getMatchingTimeSchedules methods
// based on whether the user has same time availability or just same date

/**
 * Returns a list of users with the same time schedule as the given user.
 * For now, if the users match, simply return true
 * TODO: Implement this method.
 */
// static bool getSimilarUsersWithSameTimeSchedule(TimeScheduler userA,
//     TimeScheduler userB) {
//   final aTimeSchedule = userA.getTimeSchedule();
//   final bTimeSchedule = userB.getTimeSchedule();
//   for (int i = 0; i < aTimeSchedule.length; i++) {
//     //check if b contains the date we are currently on
//     // I first have to evaluate the date in the list, to see if they match
//     if (bTimeSchedule.containsKey(aTimeSchedule.keys.elementAt(i))) {
//       List<String>? aRecord = aTimeSchedule[aTimeSchedule.keys.elementAt(i)];
//       List<String>? bRecord = bTimeSchedule[aTimeSchedule.keys.elementAt(i)];
//       // check if the time aligns
//       // aRecord?.
//       if (aRecord == bRecord) {
//         print("hello");
//         return true;
//       }
//     }
//   }
//   return true;
// }
}
