import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static String id = 'chat';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late ChatUser currentUser;

  @override
  void initState() {
    super.initState();
    final user = _auth.currentUser!;
    currentUser = ChatUser(
      id: user.uid,
      firstName: user.email?.split('@')[0] ?? "User",
    );
  }

  void _handleSendMessage(ChatMessage message) {
    _firestore.collection('messages').add({
      'text': message.text,
      'userId': currentUser.id,
      'userName': currentUser.firstName,
      'createdAt': Timestamp.now(),
    });
  }

  InputOptions _inputOptions() {
    return InputOptions(
      inputDecoration: InputDecoration(
        hintText: "Type a message...",
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      inputToolbarPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      inputToolbarStyle: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      sendButtonBuilder: (send) {
        return GestureDetector(
          onTap: send,
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/scholar.png', height: 40),
            const SizedBox(width: 8),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                fontSize: 22,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(200, 104, 58, 183),
              Color.fromARGB(200, 223, 64, 251),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('messages')
              .orderBy('createdAt', descending: false) 
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<ChatMessage> messages = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return ChatMessage(
                text: data['text'],
                user: ChatUser(
                  id: data['userId'],
                  firstName: data['userName'],
                ),
                createdAt: (data['createdAt'] as Timestamp).toDate(),
              );
            }).toList();

            
            messages = messages.reversed.toList();

            return DashChat(
              currentUser: currentUser,
              messages: messages,
              messageOptions: const MessageOptions(
                showOtherUsersName: true,
                showTime: true,
                showOtherUsersAvatar:true, 
                showCurrentUserAvatar: false, 
                timeTextColor: Color.fromARGB(221, 233, 230, 230),
                currentUserTimeTextColor: Colors.white70,
                containerColor: Color.fromARGB(200, 223, 64, 251),
                textColor: Colors.black,
                currentUserContainerColor: Color.fromARGB(255, 131, 56, 236),
                currentUserTextColor: Colors.white,
              ),
              inputOptions: _inputOptions(),
              onSend: _handleSendMessage,
            );
          },
        ),
      ),
    );
  }
}
