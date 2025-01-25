import 'package:chating_app/widgets/chat_msgs.dart';
import 'package:chating_app/widgets/new_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    final notificationToken = await fcm.getToken();
    print(notificationToken);
  }

  @override
  void initState() {
    super.initState();
    setupNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fire Chat'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: ChatMsgs(),
          ),
          NewMsg(),
        ],
      ),
    );
  }
}
