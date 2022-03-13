import 'package:chat_app/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
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
                    chatDocs[index]['text'],
                    chatDocs[index]['username'], // todo 4 (next new_messages.dart)
                    chatDocs[index]['userId'] == futureSnapshot.data.uid,
                    key: ValueKey(chatDocs[index].documentID,),
                  );
                },
              );
            });
      },
    );
  }
}
