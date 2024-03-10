class TimeScheduler {
  var timeSchedule;

  TimeScheduler() {
    timeSchedule = Map<String, List<String>>();
  }

  /**
   * Sets the time schedule of the user based on input
   */
  void setTimeSchedule(Map<String, List<String>> timeSchedule) {
    this.timeSchedule = timeSchedule;
  }

  /**
   * Returns the time schedule of the user
   */
  Map<String, List<String>> getTimeSchedule() {
    return timeSchedule;
  }

  /**
   * Returns a list of users with the same time schedule as the given user.
   * For now, if the users match, simply return true
   * TODO: Implement this method.
   */
  static bool getSimilarUsersWithSameTimeSchedule(
      TimeScheduler userA, TimeScheduler userB) {
    final aTimeSchedule = userA.getTimeSchedule();
    final bTimeSchedule = userB.getTimeSchedule();
    for (int i = 0; i < aTimeSchedule.length; i++) {
      //check if b contains the date we are currently on
      // I first have to evaluate the date in the list, to see if they match
      if (bTimeSchedule.containsKey(aTimeSchedule.keys.elementAt(i))) {
        List<String>? aRecord = aTimeSchedule[aTimeSchedule.keys.elementAt(i)];
        List<String>? bRecord = bTimeSchedule[aTimeSchedule.keys.elementAt(i)];
        // check if the time aligns
        // aRecord?.
        if (aRecord == bRecord) {
          print("hello");
          return true;
        }
      }
    }
    return true;
  }
}
