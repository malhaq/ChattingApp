import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMsgs extends StatelessWidget {
  const ChatMsgs({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return Center(
            child: const Text('no msgs to display'),
          );
        }
        if (chatSnapshots.hasError) {
          return Center(
            child: const Text('Something went wrong...'),
          );
        }

        final loadedMsgs = chatSnapshots.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 40,
            right: 30,
            left: 30,
          ),
          reverse: true,
          itemCount: loadedMsgs.length,
          itemBuilder: (ctx, index) {
            return Text(loadedMsgs[index].data()['text']);
          },
        );
      },
    );
  }
}
