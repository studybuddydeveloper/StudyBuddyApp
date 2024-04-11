import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/src/utils/User_Data.dart';

class TestingDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the AuthProvider
    final authProvider = Provider.of<UserData>(context);

    // Access the user data fields
    String? userId = authProvider.userId;
    String? displayName = authProvider.displayName;
    String? college = authProvider.college;
    String? major = authProvider.major;
    return Text('User ID: $userId,'
        ' Display Name: $displayName, College: $college, Major: $major');
  }
}
