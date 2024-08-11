import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/chat_repository_model.dart';

class ChatRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // creates a brand new chat
  Future<void> sendMessage(String receiverId, String message) async {
    //   get the current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //   create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        timestamp: timestamp,
        message: message);

    // construct the chatroom ids for currentuser and receiver
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
//     add new message to the firestore database\

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection("messaes")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String user1Id, String user2Id) {
    List<String> ids = [user1Id, user2Id];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
