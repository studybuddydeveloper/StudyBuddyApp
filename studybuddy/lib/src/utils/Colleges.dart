// Adding the colleges collection list to the firestore database

class Colleges {
  final String college_id;
  final String college_name;
  final String state;
  final String country;

  Colleges({
    required this.college_id,
    required this.college_name,
    required this.state,
    required this.country,
  });
}
