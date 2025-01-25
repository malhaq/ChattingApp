import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMsg extends StatefulWidget {
  const NewMsg({super.key});

  @override
  State<NewMsg> createState() {
    return _NewMsgState();
  }
}

class _NewMsgState extends State<NewMsg> {
  final _msgController = TextEditingController();

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  void _sendMsg() async {
    final enteredMsg = _msgController.text;
    if (enteredMsg.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMsg,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['username'],
      'userImage': userData.data()!['image_url'],
    });
    _msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 1,
        bottom: 14,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _msgController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(labelText: 'Send a meddage...'),
            ),
          ),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.send_outlined),
            onPressed: _sendMsg,
          )
        ],
      ),
    );
  }
}
