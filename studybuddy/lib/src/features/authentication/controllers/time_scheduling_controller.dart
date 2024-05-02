import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../utils/TimeScheduler.dart';
import '../../../utils/UserAvailabilityModel.dart';

/**
 * This class handles communication between the front end and the backend for the
 * time scheduling of the user.
 */

class TimeSchedulingController extends GetxController {
  List<String> userAvailability;

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  late TimeScheduler _timeScheduler;

  late UserAvailabilityModel _availabilityModel =
      UserAvailabilityModel.instance;

  // retrievin the user's id

  TimeSchedulingController({
    required this.userAvailability,
  });

  // TimeSchedulingController(){}

  static TimeSchedulingController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    saveAvailabilityToDatabase();
  }

  /**
   * This gets one availability record and parses it into a pair or tuple
   */
  List<String> parseUserAvailability(String availability) {
    List<String> userTimeRecord = [];
    //get the date which is before the space
    String date = availability.split(' ')[0];
    // print("The date is: $date");
    //get the start time which is after the space
    String startTime = availability.split(' ')[1].split('-')[0];
    //get the end time which is after the hyphen
    String endTime = availability.split(' ')[1].split('-')[1];
    userTimeRecord = [date, startTime, endTime];
    return userTimeRecord;
  }

  Future<void> saveAvailabilityToDatabase() async {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    //parse the user availability into a pair
    for (String availability in userAvailability) {
      List<String> userTimeList = parseUserAvailability(availability);
      // Save the user's availability to the database
      // first break down the record
      String dayOfWeek = userTimeList[0];
      String startTime = userTimeList[1];
      String endTime = userTimeList[2];

      _availabilityModel = UserAvailabilityModel(
          dayOfWeek: dayOfWeek, startTime: startTime, endTime: endTime);
      _timeScheduler = TimeScheduler(uid: userId);
      _timeScheduler.saveToDatabase(dayOfWeek, startTime, endTime);
    }
  }
}
