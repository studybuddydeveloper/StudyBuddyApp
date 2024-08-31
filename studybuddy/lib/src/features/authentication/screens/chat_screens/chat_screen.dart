import 'package:flutter/material.dart';

class ChatScreenMain extends StatefulWidget {
  const ChatScreenMain({super.key});

  @override
  State<ChatScreenMain> createState() => _ChatScreenMainState();
}

class _ChatScreenMainState extends State<ChatScreenMain> {
  @override
  Widget build(BuildContext context) {
    print("hello world");
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: 20,
        itemBuilder: (context, int index) {
          return ListTile(
            // contentPadding: EdgeInsets.all(10),
            leading: CircleAvatar(
              radius: 20,
            ),
            iconColor: Colors.indigo,
            textColor: Colors.pink,
            selectedTileColor: Colors.yellow,
            title: Text("Hello world"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            onTap: () {},
          );
        },
        // itemBuilder: itemBuilder
      ),
      // bottomNavigationBar: ,
    );
  }
}
