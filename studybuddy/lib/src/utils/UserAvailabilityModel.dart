import 'package:get/get.dart';
import 'package:meta/meta.dart';

@immutable
class UserAvailabilityModel extends GetxController {
  static UserAvailabilityModel get instance => Get.find();

  final String dayOfWeek;
  final String startTime;
  final String endTime;

  UserAvailabilityModel(
      {required this.dayOfWeek,
      required this.startTime,
      required this.endTime});

  String getDayOfWeek() {
    return dayOfWeek;
  }

  String getEndTime() {
    return endTime;
  }

  factory UserAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return UserAvailabilityModel(
        dayOfWeek: json['dayOfWeek'],
        startTime: json['startTimeOfDay'],
        endTime: json['endTimeOfDay']);
  }

//TODO: Include a method in this class that checks for overlaps between one

// check for overlaps with other timeslots, add a threshold > 30;
// return 0
// useravilabilitymodel1 and useravailabilitymodel2
//
// String getStartTime(){
//   return startTime;
// }
//
// setStartTime(String start){
//   startTime = start
// }
//
// setEndTime(String end){
//   endTime = end;
// }
}