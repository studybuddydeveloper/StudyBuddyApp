import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

/**
 * This class serves as the backend for the time scheduling of the user.
 */
class TimeScheduler extends GetxController {
  static TimeScheduler get instance => Get.find();

  // final _userAvailability = Get.put(UserAvailabilityModel(
  //     dayOfWeek: dayOfWeek,
  //     startTime: startTime,
  //     endTime: endTime)
  // )
  // UserAvailabilityModel _userAvailabilityModel = UserAvailabilityModel.instance;

  // final Map<String, List<String>> timeSchedule;
  // final List<String> dayTimeOfWeek;
  // final List<String> dayOfWeek;
  // final List<String> startTimeOfDay;
  // final List<String> endTimeOfDay;
  // final String dayOfWeek;
  // final String startTimeOfDay;
  // final String endTimeOfDay;
  final String uid;

  //
  // var timeSchedule;
  //
  // // this creates an object representation of the user's time schedule for a specific day
  TimeScheduler(
      {
      // required this.dayOfWeek,
      // required this.startTimeOfDay,
      // required this.endTimeOfDay,
      required this.uid}) {}

  /**
   * this saves the user's time schedule to the database in the time-schedule collection
   */
  void saveToDatabase(String day, String start, String end) {
    // save to database
    CollectionReference timeScheduleCollection =
        FirebaseFirestore.instance.collection('time-schedule');

    // Right now, we only let users select one timeslot per day

    // TODO: Eventually, what we would want to do Is have them select multiple timeslots per day
    // by setting startTimeOfDay and endTimeOfDay to be lists of strings
    timeScheduleCollection.doc(uid).set({
      'dayOfWeek': day,
      'startTimeOfDay': start,
      'endTimeOfDay': end,
    });
  }

  // void setTimeSchedule(Map<String, List<String>> timeSchedule) {
  //   this.timeSchedule = timeSchedule;
  // }

  /**
   * Returns the time schedule of the user
   */
  // Map<String, List<String>> getTimeSchedule() {
  //   return timeSchedule;
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

    // List of matching users looks like:
    // ['user1ID', 'user2ID', 'user3ID']
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
