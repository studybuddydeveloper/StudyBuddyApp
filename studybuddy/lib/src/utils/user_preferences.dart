import '../../src/features/authentication/models/user.dart';

class UserPreferences {
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;
  final String classYear;
  final String Major;

  const UserPreferences({
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
    required this.classYear,
    required this.Major,
  });

  UpdateUser(String name, String email) {
    User(
      imagePath:
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
      name: this.name,
      email: this.email,
      about: this.about,
      classYear: this.classYear,
      Major: this.Major,
      isDarkMode: false,
    );
  }

  static const myUser = User(
    imagePath:
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Chimamanda Adichie',
    email: 'amah@mtholyoke.edu',
    about:
    'Certified Geologist and PHD candidate in zoology with 100 years of experience in making dreams that are impossible come through.',
    isDarkMode: false,
    classYear: '2023',
    Major: 'Geology',
  );
}
