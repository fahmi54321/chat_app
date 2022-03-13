import 'package:chat_app/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>( // todo 9 untuk mendapatkan uid
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('chat')
                .orderBy(
                  'createdAt',
                  descending: true,
                )
                .snapshots(),
            builder: (
              ctx,
              chatSnapshot,
            ) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final chatDocs = chatSnapshot.data.documents;

              return ListView.builder(
                reverse: true, // scroll from the botton to the top
                itemCount: chatDocs.length,
                itemBuilder: (ctx, index) {
                  return MessageBubble(
                    chatDocs[index]['text'], // todo 10
                    chatDocs[index]['userId'] == futureSnapshot.data.uid, // todo 11
                    key: ValueKey(chatDocs[index].documentID,), // todo 12 (next new_messages)
                  );
                },
              );
            });
      },
    );
  }
}
