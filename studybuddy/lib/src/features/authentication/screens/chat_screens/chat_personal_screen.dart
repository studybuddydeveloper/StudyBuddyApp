import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/src/repository/chats_repository/chat_repository.dart';

class PersonalChatScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;

  const PersonalChatScreen(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserId});

  @override
  State<PersonalChatScreen> createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  // todo, change this to controller instead
  final ChatRepository chatController = new ChatRepository();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await chatController.sendMessage(
          widget.receiverUserId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: _buildMessageList(),
        ),
        _buildMessageInput()
      ]),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: chatController.getMessages(
            widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SnackBar(content: Text('Error ${snapshot.error})'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SnackBar(
                content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.downloading_sharp)],
            ));
          }

          return ListView(
              children: snapshot.data!.docs
                  .map((document) => _buildMessageItem(document))
                  .toList());
        });
  }

  Widget _buildMessageItem(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        children: [Text(data['senderEmail']), Text(data['message'])],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
            child: TextField(
                controller: _messageController,
                // hintText: Text('Enter Message'),
                obscureText: false)),
        IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_back))
      ],
    );
  }
}
