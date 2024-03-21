import 'package:get/get.dart';

import '../../../utils/TimeScheduler.dart';

/**
 * This class handles communication between the front end and the backend for the
 * time scheduling of the user.
 */

class TimeSchedulingController extends GetxController {
  final List<String> userAvailability;

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  late final TimeScheduler _timeScheduler;

  // retrievin the user's id

  TimeSchedulingController({required this.userAvailability});

  static TimeSchedulingController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    print("hello world");
    saveAvailabilityToDatabase();
  }

  // the user's availability is saved to the database here by calling the repo\
  // user's availability is a string list and looks like
  // ["monday 3pm-5pm", "tuesday (2pm-7pm)"]

  /**
   * This gets one availability record and parses it into a pair or tuple
   */
  List<String> parseUserAvailability(String availability) {
    print("The availability is: $availability");
    List<String> userTimeRecord = [];
    //get the date which is before the space
    String date = availability.split(' ')[0];
    print("The date is: $date");
    //get the start time which is after the space
    String startTime = availability.split(' ')[1].split('-')[0];
    //get the end time which is after the hyphen
    String endTime = availability.split(' ')[1].split('-')[1];
    userTimeRecord = [date, startTime, endTime];
    return userTimeRecord;
  }

  Future<void> saveAvailabilityToDatabase() async {
    print('The user availability is: $userAvailability');
    final String uid = "_auth.currentUser!.uid";

    //parse the user availability into a pair
    for (String availability in userAvailability) {
      List<String> userTimeList = parseUserAvailability(availability);
      // Save the user's availability to the database
      // first break down the record
      String dayOfWeek = userTimeList[0];
      String startTimeOfDay = userTimeList[1];
      String endTimeOfDay = userTimeList[2];

      //save the record to the database
      _timeScheduler = TimeScheduler(
        dayOfWeek: dayOfWeek,
        startTimeOfDay: startTimeOfDay,
        endTimeOfDay: endTimeOfDay,
        uid: uid,
      );

      _timeScheduler.saveToDatabase();
    }
  }

// Future<void> fetchTimeSchedules() async {
//   try {
//     final User? user = _auth.currentUser;
//     final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
//         .collection('time-schedule')
//         .where('uid', isEqualTo: user!.uid)
//         .get();
//
//     timeSchedules.value = querySnapshot.docs
//         .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
//           final Map<String, dynamic> data = doc.data();
//           return TimeScheduler(
//             dayOfWeek: data['dayOfWeek'],
//             startTimeOfDay: data['startTimeOfDay'],
//             endTimeOfDay: data['endTimeOfDay'],
//             uid: data['uid'],
//           );
//         })
//         .toList();
//   } catch (e) {
//     print('Error fetching time schedules: $e');
//   }
// }
//
// Future<void> addTimeSchedule(TimeScheduler timeSchedule) async {
//   try {
//     await _firestore.collection('time-schedule').add({
//       'dayOfWeek': timeSchedule.dayOfWeek,
//       'startTimeOfDay': timeSchedule.startTimeOfDay,
//       'endTimeOfDay': timeSchedule.endTimeOfDay,
//       'uid': timeSchedule.uid,
//     });
//     fetchTimeSchedules();
//   } catch (e) {
//     print('Error adding time schedule: $e');
//   }
// }
//
// Future<void> deleteTimeSchedule(TimeScheduler timeSchedule) async {
//   try {
//     await _firestore
//         .collection('time-schedule')
//         .doc(timeSchedule.uid)
//         .delete();
//     fetchTimeSchedules();
//   } catch (e) {
//     print('Error deleting time schedule: $e');
//   }
}
